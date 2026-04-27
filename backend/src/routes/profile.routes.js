const express = require("express");
const authMiddleware = require("../middlewares/auth.middleware");
const validatorProfileMiddleware = require("../middlewares/validator.middleware.profile");

const router = express.Router();

const profileController = require("../controllers/profile.controller");

router.get("/profile", authMiddleware, profileController.getUserProfile);

router.put("/profile", authMiddleware, validatorProfileMiddleware, profileController.updateUserProfile);

module.exports = router;