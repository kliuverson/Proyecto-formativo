const mongoose = require("mongoose");


const productSchema = new mongoose.Schema({

    nombre: {
        type: String,
        required: true,
        trim: true
    },

    descripcion: {
        type: String
    },

    precio: {
        type: Number,
        required: true
    },

    stock: {
        type: Number,
        default: 0
    },

    category: {
        type: String,
    },

    image: {
        type: String,
        required: true
    }
});

const productModel = mongoose.model("productos", productSchema);

module.exports = productModel;