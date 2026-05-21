const express = require("express");

const router = express.Router();

const orderController = require("../controllers/order.controller");

const authMiddleware = require("../middlewares/auth.middleware");


// CREAR ORDEN
router.post(
  "/",
  authMiddleware,
  orderController.createOrder
);


// MIS PEDIDOS
router.get(
  "/my-orders",
  authMiddleware,
  orderController.getMyOrders
);


// TODAS LAS ÓRDENES
router.get(
  "/",
  authMiddleware,
  orderController.getAllOrders
);


// ACTUALIZAR ESTADO
router.put(
  "/:id/status",
  authMiddleware,
  orderController.updateOrderStatus
);

module.exports = router;