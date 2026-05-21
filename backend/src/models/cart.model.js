const mongoose = require("mongoose");

const cartItemSchema = new mongoose.Schema(
  {
    productoId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "productos",
      required: true,
    },

    precio: {
      type: Number,
      required: true,
      min: 0,
    },

    cantidad: {
      type: Number,
      required: true,
      default: 1,
      min: 1,
    },
  },
  { _id: false }
);

const cartSchema = new mongoose.Schema(
  {
    userId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "usuarios",
      required: true,
      unique: true,
    },

    items: {
      type: [cartItemSchema],
      default: [],
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("carts", cartSchema);