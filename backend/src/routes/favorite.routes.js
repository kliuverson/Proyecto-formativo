const express = require("express");

const router = express.Router();

const authMiddleware = require("../middlewares/auth.middleware");

const favoriteController = require("../controllers/favorite.controller");


/**
 * @swagger
 * tags:
 *   name: Favoritos
 *   description: API de favoritos
 */


/**
 * @swagger
 * /api/favorites:
 *   get:
 *     summary: Obtener favoritos del usuario
 *     tags: [Favoritos]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Lista de favoritos
 *       401:
 *         description: No autorizado
 */
router.get(
  "/",
  authMiddleware,
  favoriteController.getFavorites
);


/**
 * @swagger
 * /api/favorites/add:
 *   post:
 *     summary: Agregar producto a favoritos
 *     tags: [Favoritos]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           example:
 *             productId: "665d8e5f4f1a2c1234567890"
 *     responses:
 *       200:
 *         description: Producto agregado
 */
router.post(
  "/add",
  authMiddleware,
  favoriteController.addFavorite
);


/**
 * @swagger
 * /api/favorites/item/{productId}:
 *   delete:
 *     summary: Eliminar producto de favoritos
 *     tags: [Favoritos]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Producto eliminado
 */
router.delete(
  "/item/:productId",
  authMiddleware,
  favoriteController.removeFavorite
);


/**
 * @swagger
 * /api/favorites/clear:
 *   delete:
 *     summary: Vaciar favoritos
 *     tags: [Favoritos]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Favoritos eliminados
 */
router.delete(
  "/clear",
  authMiddleware,
  favoriteController.clearFavorites
);


module.exports = router;