const express = require("express");

const router = express.Router();

const authMiddleware = require("../middlewares/auth.middleware");

const addressController = require("../controllers/address.controller");

/**
 * @swagger
 * tags:
 *   name: Direcciones
 *   description: API de direcciones
 */


/**
 * @swagger
 * /api/address:
 *   get:
 *     summary: Obtener direcciones del usuario autenticado
 *     tags: [Direcciones]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Lista de direcciones
 *       401:
 *         description: No autorizado
 */
router.get(
  "/",
  authMiddleware,
  addressController.getAddresses
);


/**
 * @swagger
 * /api/address/{id}:
 *   get:
 *     summary: Obtener dirección por ID
 *     tags: [Direcciones]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Dirección encontrada
 *       404:
 *         description: Dirección no encontrada
 */
router.get(
  "/:id",
  authMiddleware,
  addressController.getAddressById
);


/**
 * @swagger
 * /api/address:
 *   post:
 *     summary: Crear dirección
 *     tags: [Direcciones]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           example:
 *             nombreDestinatario: "Maria Camacho"
 *             telefono: "3001234567"
 *             departamento: "Atlantico"
 *             ciudad: "Barranquilla"
 *             direccion: "Cra 11 #26-145"
 *             referencia: "Casa blanca"
 *             codigoPostal: "080001"
 *             principal: true
 *     responses:
 *       201:
 *         description: Dirección creada
 *       400:
 *         description: Datos inválidos
 */
router.post(
  "/",
  authMiddleware,
  addressController.createAddress
);


/**
 * @swagger
 * /api/address/{id}:
 *   put:
 *     summary: Actualizar dirección
 *     tags: [Direcciones]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Dirección actualizada
 *       404:
 *         description: Dirección no encontrada
 */
router.put(
  "/:id",
  authMiddleware,
  addressController.updateAddress
);


/**
 * @swagger
 * /api/address/{id}:
 *   delete:
 *     summary: Eliminar dirección
 *     tags: [Direcciones]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Dirección eliminada
 *       404:
 *         description: Dirección no encontrada
 */
router.delete(
  "/:id",
  authMiddleware,
  addressController.deleteAddress
);


/**
 * @swagger
 * /api/address/{id}/principal:
 *   patch:
 *     summary: Establecer dirección principal
 *     tags: [Direcciones]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Dirección principal actualizada
 *       404:
 *         description: Dirección no encontrada
 */
router.patch(
  "/:id/principal",
  authMiddleware,
  addressController.setPrincipalAddress
);

module.exports = router;