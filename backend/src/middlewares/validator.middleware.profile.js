const { body } = require("express-validator");

const validationProfile = [
    body("nombre").optional().not().isEmpty().withMessage("El nombre es requerido"),
    body("correo").optional().isEmail().withMessage("Por favor ingresar un correo electronico valido"),
    body("numeroTelefono").optional().isMobilePhone().withMessage("Ingrese un numero de telefono valido"),
    body("username").optional().not().isEmpty().withMessage("El nombre de usuario es requerido")
];

module.exports = validationProfile;