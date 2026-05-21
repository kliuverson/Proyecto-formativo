const mongoose = require("mongoose");
const Cart = require("../models/cart.model");
const Product = require("../models/products.model");


// ==========================================
// Helpers
// ==========================================
const calcularTotal = (items) =>
    items.reduce((sum, item) => sum + item.precio * item.cantidad, 0);

const calcularCantidadItems = (items) =>
    items.reduce((sum, item) => sum + item.cantidad, 0);

const obtenerOCrearCarrito = async (userId) => {
    let cart = await Cart.findOne({ userId });

    if (!cart) {
        cart = await Cart.create({
            userId,
            items: [],
        });
    }

    return cart;
};

const construirImagenUrl = (req, image) => {
    if (!image) return "";

    if (image.startsWith("http")) return image;

    const baseURL = `${req.protocol}://${req.get("host")}`;

    return `${baseURL}${image.startsWith("/") ? "" : "/"}${image}`;
};

// ==========================================
// Obtener carrito
// GET /api/cart
// ==========================================
exports.getCart = async (req, res) => {
    try {

        const userId = req.user.id;

        const cart = await obtenerOCrearCarrito(userId);

        await cart.populate(
            "items.productoId",
            "nombre precio image stock category"
        );

        // Transformar respuesta sin guardar en DB
        const items = cart.items.map((item) => {
            const producto = item.productoId;

            if (!producto) {
                return item.toObject();
            }

            return {
                ...item.toObject(),
                precio: producto.precio,
                productoId: {
                    ...producto.toObject(),
                    image: construirImagenUrl(req, producto.image),
                },
            };
        });

        const total = calcularTotal(items);
        const cantidadItems = calcularCantidadItems(items);

        return res.status(200).json({
            cart: {
                ...cart.toObject(),
                items,
            },
            total,
            cantidadItems,
        });
    } catch (error) {
        return res.status(500).json({
            message: "Error al obtener carrito",
            error: error.message,
        });
    }
};

// ==========================================
// Agregar producto
// POST /api/cart/add
// ==========================================
exports.addToCart = async (req, res) => {
    try {

        const userId = req.user.id;
        const { productoId } = req.body;
        const cantidad = req.body.cantidad !== undefined ? Number(req.body.cantidad) : 1;

        if (!mongoose.Types.ObjectId.isValid(productoId)) {
            return res.status(400).json({
                message: "ID inválido",
            });
        }

        if (!productoId) {
            return res.status(400).json({
                message: "Producto requerido",
            });
        }

        if (cantidad < 1) {
            return res.status(400).json({
                message: "Cantidad inválida",
            });
        }

        const product = await Product.findById(productoId);

        if (!product) {
            return res.status(404).json({
                message: "Producto no encontrado",
            });
        }

        const cart = await obtenerOCrearCarrito(userId);

        const index = cart.items.findIndex(
            (item) => item.productoId.toString() === productoId
        );

        if (index >= 0) {
            const nuevaCantidad = cart.items[index].cantidad + cantidad;

            if (nuevaCantidad > product.stock) {
                return res.status(400).json({
                    message: "Stock insuficiente",
                });
            }

            cart.items[index].cantidad = nuevaCantidad;
        } else {
            if (cantidad > product.stock) {
                return res.status(400).json({
                    message: "Stock insuficiente",
                });
            }

            cart.items.push({
                productoId,
                cantidad,
                precio: product.precio,
            });
        }

        await cart.save();

        return res.status(200).json({
            message: "Producto agregado al carrito",
        });
    } catch (error) {
        return res.status(500).json({
            message: "Error al agregar producto",
            error: error.message,
        });
    }
};

// ==========================================
// Actualizar cantidad
// PUT /api/cart/item/:productId
// ==========================================
exports.updateQuantity = async (req, res) => {
    try {

        const userId = req.user.id;
        const { productId } = req.params;

        if (!mongoose.Types.ObjectId.isValid(productId)) {
            return res.status(400).json({
                message: "ID inválido",
            });
        }

        const cantidad = req.body.cantidad !== undefined ? Number(req.body.cantidad) : 1;

        if (cantidad < 1) {
            return res.status(400).json({
                message: "Cantidad inválida",
            });
        }

        const product = await Product.findById(productId);

        if (!product) {
            return res.status(404).json({
                message: "Producto no encontrado",
            });
        }

        if (cantidad > product.stock) {
            return res.status(400).json({
                message: "Stock insuficiente",
            });
        }

        const cart = await obtenerOCrearCarrito(userId);

        const item = cart.items.find(
            (item) => item.productoId.toString() === productId
        );

        if (!item) {
            return res.status(404).json({
                message: "Producto no existe en carrito",
            });
        }

        item.cantidad = cantidad;

        await cart.save();

        return res.status(200).json({
            message: "Cantidad actualizada",
        });
    } catch (error) {
        return res.status(500).json({
            message: "Error al actualizar cantidad",
            error: error.message,
        });
    }
};

// ==========================================
// Eliminar item
// DELETE /api/cart/item/:productId
// ==========================================
exports.removeItem = async (req, res) => {
    try {

        const userId = req.user.id;
        const { productId } = req.params;

        if (!mongoose.Types.ObjectId.isValid(productId)) {
            return res.status(400).json({
                message: "ID inválido",
            });
        }

        const cart = await obtenerOCrearCarrito(userId);

        const before = cart.items.length;

        cart.items = cart.items.filter(
            (item) => item.productoId.toString() !== productId
        );

        if (before === cart.items.length) {
            return res.status(404).json({
                message: "Producto no existe en carrito",
            });
        }

        await cart.save();

        return res.status(200).json({
            message: "Producto eliminado",
        });
    } catch (error) {
        return res.status(500).json({
            message: "Error al eliminar producto",
            error: error.message,
        });
    }
};

// ==========================================
// Vaciar carrito
// DELETE /api/cart/clear
// ==========================================
exports.clearCart = async (req, res) => {
    try {
        const userId = req.user.id;

        const cart = await obtenerOCrearCarrito(userId);

        cart.items = [];

        await cart.save();

        return res.status(200).json({
            message: "Carrito vaciado",
        });
    } catch (error) {
        return res.status(500).json({
            message: "Error al vaciar carrito",
            error: error.message,
        });
    }
};