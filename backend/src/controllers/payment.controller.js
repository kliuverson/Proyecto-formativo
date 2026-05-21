const axios = require("axios");
const { v4: uuidv4 } = require("uuid");
const crypto = require("crypto");

const Order = require("../models/order.model");
const User = require("../models/user.model");

exports.createPayment = async (req, res) => {
  try {

    const { orderId } = req.body;

    // =========================
    // VALIDAR ORDEN
    // =========================

    const order = await Order.findById(orderId);

    if (!order) {
      return res.status(404).json({
        message: "Orden no encontrada",
      });
    }

    // =========================
    // USUARIO
    // =========================

    const user = await User.findById(order.user);

    if (!user) {
      return res.status(404).json({
        message: "Usuario no encontrado",
      });
    }

    // =========================
    // VARIABLES WOMPI
    // =========================

    const reference = `ORDER-${uuidv4()}`;

    const currency = "COP";

    const amountInCents = Math.round(order.total * 100);

    // =========================
    // OBTENER ACCEPTANCE TOKEN
    // =========================

    const merchantResponse = await axios.get(
      `https://sandbox.wompi.co/v1/merchants/${process.env.WOMPI_PUBLIC_KEY}`
    );

    const acceptanceToken =
      merchantResponse.data.data.presigned_acceptance.acceptance_token;

    // =========================
    // GENERAR FIRMA
    // =========================

    const integrityString =
      `${reference}${amountInCents}${currency}${process.env.WOMPI_INTEGRITY_SECRET}`;

    const integritySignature = crypto
      .createHash("sha256")
      .update(integrityString)
      .digest("hex");

    console.log("INTEGRITY STRING:", integrityString);
    console.log("SIGNATURE:", integritySignature);

    // =========================
    // URL CHECKOUT WOMPI
    // =========================

    const checkoutUrl =
      `https://checkout.wompi.co/p/?public-key=${process.env.WOMPI_PUBLIC_KEY}` +
      `&currency=${currency}` +
      `&amount-in-cents=${amountInCents}` +
      `&reference=${reference}` +
      `&signature:integrity=${integritySignature}`;

    // =========================
    // GUARDAR ORDEN
    // =========================

    order.paymentReference = reference;

    await order.save();

    // =========================
    // RESPUESTA
    // =========================

    return res.status(200).json({
      success: true,
      checkoutUrl,
      reference,
      acceptanceToken,
    });

  } catch (error) {

    console.error("ERROR WOMPI:", error.response?.data || error.message);

    return res.status(500).json({
      message: "Error creando pago",
      error: error.response?.data || error.message,
    });
  }
};

exports.checkPaymentStatus = async (req, res) => {
  try {
    const { reference } = req.params;

    if (!reference) {
      return res.status(400).json({ message: "Reference is required" });
    }

    // Buscar transacción en Wompi (sandbox)
    if (!process.env.WOMPI_PRIVATE_KEY) {
      console.error("WOMPI_PRIVATE_KEY no definida en el servidor");
      return res.status(500).json({ message: "WOMPI_PRIVATE_KEY no definida en el servidor" });
    }

    const txResponse = await axios.get(
      `https://sandbox.wompi.co/v1/transactions?reference=${reference}`,
      {
        headers: {
          Authorization: `Bearer ${process.env.WOMPI_PRIVATE_KEY}`,
        },
      }
    );

    const transactions = txResponse.data.data || [];

    console.log("checkPaymentStatus - reference:", reference);
    console.log("Wompi transactions:", transactions.length, transactions);

    const tx = transactions.length > 0 ? transactions[0] : null;

    // ejemplo: tx.status puede ser 'APPROVED', 'DECLINED', 'PENDING'
    const txStatus = tx ? tx.status : null;

    // Buscar la orden asociada
    const order = await Order.findOne({ paymentReference: reference });

    if (!order) {
      return res.status(404).json({ message: "Orden no encontrada" });
    }

    // Si la transacción fue aprobada, marcar la orden como paid y descontar stock
    if (txStatus && (txStatus === "APPROVED" || txStatus.toLowerCase() === "approved") && order.status !== "paid") {
      order.status = "paid";

      // descontar stock
      for (const item of order.items) {
        const Product = require("../models/products.model");
        const product = await Product.findById(item.product);
        if (product) {
          product.stock -= item.quantity;
          await product.save();
        }
      }

      await order.save();
    }

    // Si no hay transacciones aún, devolvemos el estado actual de la orden (pending)
    return res.status(200).json({
      success: true,
      status: order.status,
      transaction: tx,
      order,
      message: tx ? 'transaction found' : 'no transaction yet',
    });

  } catch (error) {
    console.error("ERROR checkPaymentStatus:", error.response?.data || error.message);
    return res.status(500).json({ message: "Error consultando estado del pago", error: error.response?.data || error.message });
  }
};