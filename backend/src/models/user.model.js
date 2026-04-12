const mongoose = require("mongoose");
const { Schema } = mongoose

const userSchema = new mongoose.Schema({

    nombre: {
        type: String,
        trim: true,
        required: true,
    },

    apellido: {
        type: String,
        trim: true,
        required: true,
    },

    correo: {
        type: String,
        lowercase: true,
        required: true,
        trim: true,
        unique: true,
    },

    numeroTelefono: { type: String, required: true, trim: true },

    username: {
        type: String,
        unique: true,
        trim: true,
        required: true
    },

    esAdmin: { type: Boolean, default: false }, 

    password: {
        type: String,
        required: true,
        minlength: 8
    },

    listFavo: [
        {
            productoID: { type: Schema.Types.ObjectId, ref: "productos", required: true },
            productoNombre: { type: String, required: true },
            productoImage: { type: String, required: true }
        },
    ],

});

const userModel = mongoose.model("usuarios", userSchema);

module.exports = userModel;
