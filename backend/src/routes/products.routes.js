const express = require("express");
const authMiddleware = require("../middlewares/auth.middleware");
const roleMiddleware = require("../middlewares/role.middleware");

const router = express.Router();

const productController = require("../controllers/product.controller");

/**
 * @swagger
 * /api/products:
 *   get:
 *     summary: Obtener todos los productos (requiere autenticación)
 *     tags: [Productos]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Lista de productos
 *       401:
 *         description: No autorizado
 */
router.get("/", authMiddleware, productController.getProducts);


/**
 * @swagger
 * /api/products/{id}:
 *   get:
 *     summary: Obtener producto por ID (requiere autenticación)
 *     tags: [Productos]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Producto encontrado
 *       404:
 *         description: Producto no encontrado
 *       401:
 *         description: No autorizado
 */
router.get("/:id", authMiddleware, productController.getProductById);


/**
 * @swagger
 * /api/products:
 *   post:
 *     summary: Crear producto (Solo Admin)
 *     tags: [Productos]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           example:
 *             sku: "FER-001"
 *             nombre: "Taladro"
 *             descripcion: "Taladro eléctrico"
 *             precio: 150000
 *             stock: 5
 *             category: "Herramientas"
 *             image: "taladro.jpg"
 *     responses:
 *       201:
 *         description: Producto creado
 *       400:
 *         description: Error en datos
 *       403:
 *         description: No autorizado (requiere Admin)
 *       409:
 *         description: SKU duplicado
 */
router.post("/", authMiddleware, roleMiddleware("Admin"), productController.createProduct);


/**
 * @swagger
 * /api/products/{id}:
 *   put:
 *     summary: Actualizar producto (Solo Admin)
 *     tags: [Productos]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Producto actualizado
 *       400:
 *         description: Error en datos
 *       403:
 *         description: No autorizado
 *       404:
 *         description: Producto no encontrado
 */
router.put("/:id", authMiddleware, roleMiddleware("Admin"), productController.updateProduct);


/**
 * @swagger
 * /api/products/{id}:
 *   delete:
 *     summary: Eliminar producto (Solo Admin)
 *     tags: [Productos]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       204:
 *         description: Producto eliminado
 *       403:
 *         description: No autorizado
 *       404:
 *         description: Producto no encontrado
 */
router.delete("/:id", authMiddleware, roleMiddleware("Admin"), productController.deleteProduct);



module.exports = router;