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