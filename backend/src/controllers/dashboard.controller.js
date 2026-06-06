// controllers/dashboard.controller.js
const Order = require("../models/order.model");
const Product = require("../models/products.model");
const User = require("../models/user.model");

exports.getDashboard = async (req, res) => {
  try {
    const ahora = new Date();
    const inicioHoy = new Date(ahora.getFullYear(), ahora.getMonth(), ahora.getDate());
    const inicioMes = new Date(ahora.getFullYear(), ahora.getMonth(), 1);
    const inicioAnio = new Date(ahora.getFullYear(), 0, 1);

    // ─── Ventas ───────────────────────────────────────────────────────────────
    const [ventasTotal, ventasHoy] = await Promise.all([
      Order.aggregate([
        { $match: { status: "paid" } },
        { $group: { _id: null, total: { $sum: "$total" } } },
      ]),
      Order.aggregate([
        { $match: { status: "paid", createdAt: { $gte: inicioHoy } } },
        { $group: { _id: null, total: { $sum: "$total" } } },
      ]),
    ]);

    // ─── Pedidos ──────────────────────────────────────────────────────────────
    const [totalPedidos, pedidosPendientes] = await Promise.all([
      Order.countDocuments(),
      Order.countDocuments({ status: "pending" }),
    ]);

    // ─── Productos ────────────────────────────────────────────────────────────
    const STOCK_BAJO_LIMITE = 5;

    const [totalProductos, productosStockBajo] = await Promise.all([
      Product.countDocuments({ estaActivo: true }),
      Product.countDocuments({ estaActivo: true, stock: { $lte: STOCK_BAJO_LIMITE } }),
    ]);

    // ─── Clientes ─────────────────────────────────────────────────────────────
    const [totalClientes, clientesNuevos] = await Promise.all([
      User.countDocuments({ esAdmin: false }),
      User.countDocuments({ esAdmin: false, createdAt: { $gte: inicioMes } }),
    ]);

    // ─── Ventas por mes (últimos 6 meses) ─────────────────────────────────────
    const ventasPorMes = await Order.aggregate([
      {
        $match: {
          status: "paid",
          createdAt: { $gte: new Date(ahora.getFullYear(), ahora.getMonth() - 5, 1) },
        },
      },
      {
        $group: {
          _id: { anio: { $year: "$createdAt" }, mes: { $month: "$createdAt" } },
          total: { $sum: "$total" },
          cantidad: { $sum: 1 },
        },
      },
      { $sort: { "_id.anio": 1, "_id.mes": 1 } },
      {
        $project: {
          _id: 0,
          mes: "$_id.mes",
          anio: "$_id.anio",
          total: 1,
          cantidad: 1,
        },
      },
    ]);

    // ─── Productos más vendidos ────────────────────────────────────────────────
    const productosMasVendidos = await Order.aggregate([
      { $match: { status: "paid" } },
      { $unwind: "$items" },
      {
        $group: {
          _id: "$items.product",
          nombre: { $first: "$items.nombre" },
          ventas: { $sum: "$items.quantity" },
          ingresos: { $sum: "$items.subtotal" },
        },
      },
      { $sort: { ventas: -1 } },
      { $limit: 5 },
      {
        $project: {
          _id: 0,
          nombre: 1,
          ventas: 1,
          ingresos: 1,
        },
      },
    ]);

    // ─── Pedidos recientes ─────────────────────────────────────────────────────
    const pedidosRecientes = await Order.find()
      .populate("user", "nombre apellido")
      .sort({ createdAt: -1 })
      .limit(5)
      .lean();

    const pedidosFormateados = pedidosRecientes.map((p) => ({
      cliente: p.user ? `${p.user.nombre} ${p.user.apellido}` : "Cliente",
      total: p.total,
      estado: p.status === "paid" ? "completado" : p.status === "pending" ? "pendiente" : p.status,
      fecha: new Date(p.createdAt).toLocaleDateString("es-CO"),
    }));

    // ─── Stock crítico ─────────────────────────────────────────────────────────
    const stockCritico = await Product.find({
      estaActivo: true,
      stock: { $lte: STOCK_BAJO_LIMITE },
    })
      .select("nombre sku stock")
      .sort({ stock: 1 })
      .limit(5)
      .lean();

    // ─── Respuesta ────────────────────────────────────────────────────────────
    return res.status(200).json({
      ventas: {
        total: ventasTotal[0]?.total ?? 0,
        hoy: ventasHoy[0]?.total ?? 0,
      },
      pedidos: {
        total: totalPedidos,
        pendientes: pedidosPendientes,
      },
      productos: {
        total: totalProductos,
        stockBajo: productosStockBajo,
      },
      clientes: {
        total: totalClientes,
        nuevos: clientesNuevos,
      },
      ventasPorMes,
      productosMasVendidos,
      pedidosRecientes: pedidosFormateados,
      stockCritico,
    });
  } catch (error) {
    console.error("ERROR dashboard:", error.message);
    return res.status(500).json({ message: "Error obteniendo dashboard", error: error.message });
  }
};