const express = require("express");
const authMiddleware = require("../middlewares/auth.middleware");
const cartController = require("../controllers/cart.controller");

const router = express.Router();

router.get("/", authMiddleware, cartController.getCart);

router.post("/add", authMiddleware, cartController.addToCart);

router.put("/item/:productId", authMiddleware, cartController.updateQuantity);

router.delete("/item/:productId", authMiddleware, cartController.removeItem);

router.delete("/clear", authMiddleware, cartController.clearCart);

module.exports = router;