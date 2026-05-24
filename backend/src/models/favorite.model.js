const mongoose = require("mongoose");

const favoriteItemSchema =
  new mongoose.Schema({
    productId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Product",
      required: true,
    },
  });

const favoriteSchema =
  new mongoose.Schema(
    {
      userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
        required: true,
        unique: true,
      },

      items: [favoriteItemSchema],
    },
    {
      timestamps: true,
    },
  );

module.exports = mongoose.model(
  "Favorite",
  favoriteSchema,
);