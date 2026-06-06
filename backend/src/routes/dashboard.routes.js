// routes/dashboard.routes.js
const express = require("express");
const router = express.Router();

const dashboardController = require("../controllers/dashboard.controller");
const authMiddleware = require("../middlewares/auth.middleware");
const roleMiddleware = require("../middlewares/role.middleware");

// Solo admin puede ver el dashboard
router.get("/", authMiddleware, roleMiddleware(true), dashboardController.getDashboard);

module.exports = router;