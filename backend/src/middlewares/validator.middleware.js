const { body } = require("express-validator");

const validationUser = [
    body("nombre").not().isEmpty().withMessage("El nombre es requerido"),
    body("correo").isEmail().withMessage("Por favor ingresar un correo electronico valido"),
    body("password").isLength({ min: 8 })
        .withMessage("La contraseña deberia ser de al menos 8 caracteres")
        .isStrongPassword().withMessage("La contraseña deberia incluir una mayuscula, una minuscula y un simbolo"),
    body("numeroTelefono").isMobilePhone().withMessage("Ingrese un numero de telefono valido")

];



module.exports =  validationUser;
