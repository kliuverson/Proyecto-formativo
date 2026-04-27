const User = require("../models/user.model");
const { validationResult } = require("express-validator");

exports.getUserProfile = async (req, res) => {
    try {
        const userID = req.user.id;
        const user = await User.findById(userID).select("-password");

        if (!user) {
            return res.status(404).json({ message: "Usuario no encontrado" });
        }

        res.status(200).json(user);

    } catch (error) {
        res.status(500).json({
            message: "Error al obtener el perfil del usuario",
            error: error.message
        });

    }
};

exports.updateUserProfile = async (req, res) => {
    console.log("Usuario autenticado:", req.user); // Log de depuración para verificar el usuario autenticado
    console.log("Datos recibidos para actualización de perfil:", req.body); // Log de depuración
    
    try {

        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            const errorsMessages = errors.array().map((error) => ({
                field: error.path,
                message: error.msg,
            }));
            return res.status(400).json({ errors: errorsMessages });
        }

        const userID = req.user.id;

        const { nombre, apellido, correo, numeroTelefono, username } = req.body;

        const updateData = {};

        if (nombre?.trim()) updateData.nombre = nombre.trim();
        if (apellido?.trim()) updateData.apellido = apellido.trim();
        if (correo?.trim()) updateData.correo = correo.trim();
        if (numeroTelefono?.trim()) updateData.numeroTelefono = numeroTelefono.trim();
        if (username?.trim()) updateData.username = username.trim();

        if (Object.keys(updateData).length === 0) {
            return res.status(400).json({ message: "No se proporcionaron datos para actualizar" });
        }

        let existingUser = null;

        if (correo || username) {
            existingUser = await User.findOne({
                $or: [
                    ...(correo ? [{ correo }] : []),
                    ...(username ? [{ username }] : [])
                ],
                _id: { $ne: userID }
            });
        }

        if (existingUser) {
            const fieldsErrors = [];

            if (correo && existingUser?.correo === correo) {
                fieldsErrors.push({ field: "correo", message: "El correo ya está en uso por otro usuario" });
            }

            if (username && existingUser?.username === username) {
                fieldsErrors.push({ field: "username", message: "El nombre de usuario ya está en uso por otro usuario" });
            }

            return res.status(409).json({ errors: fieldsErrors });
        }


        const updatedUser = await User.findByIdAndUpdate(
            userID,
            updateData,
            { new: true, runValidators: true }
        ).select("-password");

        if (!updatedUser) {
            return res.status(404).json({ message: "Usuario no encontrado" });
        }

        res.status(200).json({ message: "Perfil actualizado correctamente", user: updatedUser });

    } catch (error) {
        res.status(500).json({
            message: "Error al actualizar el perfil del usuario",
            error: error.message
        });
    }
};