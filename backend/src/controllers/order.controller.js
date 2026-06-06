const Order = require("../models/order.model");
const Product = require("../models/products.model");


// CREAR ORDEN
exports.createOrder = async (req, res) => {
  try {
    const {
      items,
      paymentReference,
      transactionId,
    } = req.body;

    if (!items || items.length === 0) {
      return res.status(400).json({
        ok: false,
        message: "No hay productos en la orden",
      });
    }

    let total = 0;

    const orderItems = [];

    for (const item of items) {
      const product = await Product.findOne({
        sku: item.productId,
      });

      if (!product) {
        return res.status(404).json({
          ok: false,
          message: "Producto no encontrado",
        });
      }

      if (product.stock < item.quantity) {
        return res.status(400).json({
          ok: false,
          message: `Stock insuficiente para ${product.nombre}`,
        });
      }

      const subtotal = product.precio * item.quantity;

      total += subtotal;

      orderItems.push({
        product: product._id,
        nombre: product.nombre,
        precio: product.precio,
        quantity: item.quantity,
        subtotal,
      });
    }

    const order = new Order({
      user: req.user.id,
      items: orderItems,
      total,
      paymentReference,
      transactionId,
      status: "pending",
    });

    const savedOrder = await order.save();

    console.log("Order created:", savedOrder);

    res.status(201).json({
      ok: true,
      order: savedOrder,
    });

  } catch (error) {
    console.log(error);

    res.status(500).json({
      ok: false,
      message: "Error creando la orden",
      error: error.message,
    });
  }
};


// OBTENER MIS PEDIDOS
exports.getMyOrders = async (req, res) => {
  try {

    console.log("===============");
    console.log("REQ.USER:");
    console.log(req.user);

    const userId = req.user.id || req.user._id;

    console.log("USER ID:");
    console.log(userId);

    const orders = await Order.find({
      user: userId,
    })
      .populate("items.product")
      .sort({ createdAt: -1 });

    console.log("ORDERS:");
    console.log(orders);

    res.json({
      ok: true,
      orders,
    });

  } catch (error) {

    console.log(error);

    res.status(500).json({
      ok: false,
      message: "Error obteniendo pedidos",
    });
  }
};


// OBTENER TODAS LAS ÓRDENES (ADMIN)
exports.getAllOrders = async (req, res) => {
  try {

    const orders = await Order.find()
      .populate("user")
      .populate("items.product")
      .sort({ createdAt: -1 });

    res.json({
      ok: true,
      orders,
    });

  } catch (error) {

    res.status(500).json({
      ok: false,
      message: "Error obteniendo órdenes",
    });
  }
};


// ACTUALIZAR ESTADO
exports.updateOrderStatus = async (req, res) => {
  try {

    const { status } = req.body;

    const order = await Order.findById(req.params.id);

    if (!order) {
      return res.status(404).json({
        ok: false,
        message: "Orden no encontrada",
      });
    }

  
    order.status = status;

    await order.save();

    res.json({
      ok: true,
      order,
    });

  } catch (error) {

    res.status(500).json({
      ok: false,
      message: "Error actualizando orden",
      error: error.message,
    });
  }
};