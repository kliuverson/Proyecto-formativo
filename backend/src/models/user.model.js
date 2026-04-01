const mongoose = require("mongoose");

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

    numeroTelefono: {
        type: String,
        required: true
    },

    username: {
        type: String,
        unique: true,
        trim: true,
        required: true
    },

    role: {
        type: String,
        default: "Cliente"
    },

    password: {
        type: String,
        required: true,
        minlength: 6
    }

});

const userModel = mongoose.model("usuarios", userSchema);

module.exports = userModel;
