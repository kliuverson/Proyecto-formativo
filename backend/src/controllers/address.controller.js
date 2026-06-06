const mongoose = require("mongoose");

const Address = require("../models/address.model");

// ==========================================
// Helpers
// ==========================================

const validarTelefono = (telefono) => {
  const regex = /^[0-9+\-\s]{7,15}$/;
  return regex.test(telefono);
};

// ==========================================
// Obtener todas las direcciones
// GET /api/address
// ==========================================

exports.getAddresses = async (req, res) => {
  try {

    const userId = req.user.id;

    const addresses = await Address.find({ userId })
      .sort({ principal: -1, createdAt: 1 });

    return res.status(200).json(addresses);

  } catch (error) {

    return res.status(500).json({
      message: "Error al obtener direcciones",
      error: error.message,
    });

  }
};

// ==========================================
// Obtener dirección por ID
// GET /api/address/:id
// ==========================================

exports.getAddressById = async (req, res) => {
  try {

    const userId = req.user.id;
    const { id } = req.params;

    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({
        message: "ID inválido",
      });
    }

    const address = await Address.findOne({
      _id: id,
      userId,
    });

    if (!address) {
      return res.status(404).json({
        message: "Dirección no encontrada",
      });
    }

    return res.status(200).json(address);

  } catch (error) {

    return res.status(500).json({
      message: "Error al obtener dirección",
      error: error.message,
    });

  }
};

// ==========================================
// Crear dirección
// POST /api/address
// ==========================================

exports.createAddress = async (req, res) => {
  try {

    const userId = req.user.id;

    const {
      nombreDestinatario,
      telefono,
      departamento,
      ciudad,
      direccion,
      referencia,
      codigoPostal,
      principal,
    } = req.body;

    // Validaciones

    if (
      !nombreDestinatario ||
      !telefono ||
      !departamento ||
      !ciudad ||
      !direccion
    ) {
      return res.status(400).json({
        message: "Todos los campos obligatorios deben completarse",
      });
    }

    if (!validarTelefono(telefono)) {
      return res.status(400).json({
        message: "Número telefónico inválido",
      });
    }

    // Verificar dirección duplicada

    const existingAddress = await Address.findOne({
      userId,
      direccion,
      ciudad,
    });

    if (existingAddress) {
      return res.status(400).json({
        message: "La dirección ya existe",
      });
    }

    // Solo una principal

    if (principal === true) {

      await Address.updateMany(
        { userId },
        { principal: false }
      );

    }

    const newAddress = new Address({
      userId,
      nombreDestinatario,
      telefono,
      departamento,
      ciudad,
      direccion,
      referencia,
      codigoPostal,
      principal,
    });

    await newAddress.save();

    return res.status(201).json({
      message: "Dirección creada correctamente",
      address: newAddress,
    });

  } catch (error) {

    return res.status(500).json({
      message: "Error al crear dirección",
      error: error.message,
    });

  }
};

// ==========================================
// Actualizar dirección
// PUT /api/address/:id
// ==========================================

exports.updateAddress = async (req, res) => {
  try {

    const userId = req.user.id;
    const { id } = req.params;

    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({
        message: "ID inválido",
      });
    }

    const address = await Address.findOne({
      _id: id,
      userId,
    });

    if (!address) {
      return res.status(404).json({
        message: "Dirección no encontrada",
      });
    }

    const {
      nombreDestinatario,
      telefono,
      departamento,
      ciudad,
      direccion,
      referencia,
      codigoPostal,
      principal,
    } = req.body;

    // Validar teléfono

    if (telefono && !validarTelefono(telefono)) {
      return res.status(400).json({
        message: "Número telefónico inválido",
      });
    }

    // Si será principal

    if (principal === true) {

      await Address.updateMany(
        { userId },
        { principal: false }
      );

    }

    address.nombreDestinatario =
      nombreDestinatario || address.nombreDestinatario;

    address.telefono =
      telefono || address.telefono;

    address.departamento =
      departamento || address.departamento;

    address.ciudad =
      ciudad || address.ciudad;

    address.direccion =
      direccion || address.direccion;

    address.referencia =
      referencia || address.referencia;

    address.codigoPostal =
      codigoPostal || address.codigoPostal;

    if (typeof principal === "boolean") {
      address.principal = principal;
    }

    await address.save();

    return res.status(200).json({
      message: "Dirección actualizada correctamente",
      address,
    });

  } catch (error) {

    return res.status(500).json({
      message: "Error al actualizar dirección",
      error: error.message,
    });

  }
};

// ==========================================
// Eliminar dirección
// DELETE /api/address/:id
// ==========================================

exports.deleteAddress = async (req, res) => {
  try {

    const userId = req.user.id;
    const { id } = req.params;

    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({
        message: "ID inválido",
      });
    }

    const address = await Address.findOneAndDelete({
      _id: id,
      userId,
    });

    if (!address) {
      return res.status(404).json({
        message: "Dirección no encontrada",
      });
    }

    return res.status(200).json({
      message: "Dirección eliminada correctamente",
    });

  } catch (error) {

    return res.status(500).json({
      message: "Error al eliminar dirección",
      error: error.message,
    });

  }
};

// ==========================================
// Establecer dirección principal
// PATCH /api/address/:id/principal
// ==========================================

exports.setPrincipalAddress = async (req, res) => {
  try {

    const userId = req.user.id;
    const { id } = req.params;

    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({
        message: "ID inválido",
      });
    }

    const address = await Address.findOne({
      _id: id,
      userId,
    });

    if (!address) {
      return res.status(404).json({
        message: "Dirección no encontrada",
      });
    }

    // Quitar principal a todas

    await Address.updateMany(
      { userId },
      { principal: false }
    );

    address.principal = true;

    await address.save();

    return res.status(200).json({
      message: "Dirección principal actualizada",
      address,
    });

  } catch (error) {

    return res.status(500).json({
      message: "Error al actualizar dirección principal",
      error: error.message,
    });

  }
};