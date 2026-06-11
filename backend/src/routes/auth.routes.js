const express = require("express");
const { registerValidator, forgotPasswordValidator } = require("../middlewares/validator.middleware");

const router = express.Router();

const authController = require("../controllers/auth.controller");

// Ruta de Registro
/**
 * @swagger
 * /api/auth/register:
 *   post:
 *     summary: Registrar usuario
 *     tags: [Auth]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           example:
 *             nombre: "Juan"
 *             apellido: "Perez"
 *             username: "juanp"
 *             correo: "juan@gmail.com"
 *             numeroTelefono: "3001234567"
 *             password: "123456"
 *     responses:
 *       201:
 *         description: Usuario registrado correctamente
 *       400:
 *         description: Datos inválidos
 *       409:
 *         description: Usuario ya existe
 */
router.post("/register", registerValidator, authController.register);

// Ruta de Login
/**
 * @swagger
 * /api/auth/login:
 *   post:
 *     summary: Iniciar sesión y obtener token JWT
 *     tags: [Auth]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           example:
 *             correo: "juan@gmail.com"
 *             password: "123456"
 *     responses:
 *       200:
 *         description: Login exitoso con token
 *       400:
 *         description: Datos inválidos
 *       401:
 *         description: Contraseña incorrecta
 *       404:
 *         description: Usuario no encontrado
 */
router.post("/login", authController.login);

router.post("/forgot-password", forgotPasswordValidator, authController.forgotPassword);

router.post("/reset-password/:token", authController.resetPassword);

module.exports = router;
