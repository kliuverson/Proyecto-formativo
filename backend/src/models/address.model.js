const mongoose = require("mongoose");

const addressSchema = new mongoose.Schema(
  {
    userId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "usuarios",
      required: true,
    },

    nombreDestinatario: {
      type: String,
      required: true,
      trim: true,
    },

    telefono: {
      type: String,
      required: true,
      trim: true,
    },

    departamento: {
      type: String,
      required: true,
      trim: true,
    },

    ciudad: {
      type: String,
      required: true,
      trim: true,
    },

    direccion: {
      type: String,
      required: true,
      trim: true,
    },

    referencia: {
      type: String,
      trim: true,
      default: "",
    },

    codigoPostal: {
      type: String,
      trim: true,
      default: "",
    },

    principal: {
      type: Boolean,
      default: false,
    },
  },
  {
    timestamps: true,
  }
);

const addressModel = mongoose.model("direcciones", addressSchema);

module.exports = addressModel;