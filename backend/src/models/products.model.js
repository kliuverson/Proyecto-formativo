const mongoose = require("mongoose");


const productSchema = new mongoose.Schema({

    sku: {
        type: String,
        required: true,
        trim: true,
        unique: true,
    },

    nombre: {
        type: String,
        required: true,
        trim: true
    },

    nombre_en: {
        type: String,
        trim: true,
        default: ""
    },

    descripcion: {
        type: String
    },

    descripcion_en: {
        type: String,
        default: ""
    },

    precio: {
        type: Number,
        required: true,
        min: [1, "El precio debe ser mayor a 0"]
    },

    stock: {
        type: Number,
        default: 0,
        min: [0, "El stock no puede ser negativo"]
    },

    category: {
        type: String,
    },

    image: {
        type: String,
        required: true
    },

    estaActivo:{
        type: Boolean,
        default: true
    }
});

const productModel = mongoose.model("productos", productSchema);

module.exports = productModel;