const express = require("express");

const router = express.Router();

const paymentController = require("../controllers/payment.controller");

const authMiddleware = require("../middlewares/auth.middleware");

router.post(
  "/create",
  authMiddleware,
  paymentController.createPayment
);

router.get(
  "/status/:reference",
  authMiddleware,
  paymentController.checkPaymentStatus
);

module.exports = router;