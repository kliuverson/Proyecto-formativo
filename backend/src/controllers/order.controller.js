const Order = require("../models/order.model");
const Product = require("../models/products.model");

exports.createOrder = async (req, res) => {
  try {
    const { items } = req.body;

    if (!items || items.length === 0) {
      return res.status(400).json({
        message: "No hay productos en la orden",
      });
    }

    let total = 0;

    const orderItems = [];

    for (const item of items) {
      const product = await Product.findById(item.productId);

      if (!product) {
        return res.status(404).json({
          message: "Producto no encontrado",
        });
      }

      if (product.stock < item.quantity) {
        return res.status(400).json({
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
    });

    const savedOrder = await order.save();

    res.status(201).json(savedOrder);

  } catch (error) {
    res.status(500).json({
      message: "Error creando la orden",
      error: error.message,
    });
  }
};