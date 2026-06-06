const User = require("../models/user.model");
const { validationResult } = require("express-validator");
const bcrypt = require("bcrypt");
const crypto = require("crypto");
const { sendEmail } = require("../services/email.service");

const jwt = require("jsonwebtoken");

// Registro de Usuario 

exports.register = async (req, res) => {
  try {
    const {
      nombre,
      apellido,
      username,
      correo,
      numeroTelefono,
      password
    } = req.body;

    // Validación
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
      const errorsMessages = errors.array().map((error) => ({
        field: error.path,
        message: error.msg,
      }));
      return res.status(400).json({ errors: errorsMessages });
    }

    // Verificar duplicados
    const userExists = await User.findOne({
      $or: [{ correo }, { username }]
    });

    if (userExists) {
      return res.status(409).json({
        message: "El usuario o correo ya existe"
      });
    }

    // Encriptar contraseña
    const hashedPassword = await bcrypt.hash(password, 10);

    const newUser = new User({
      nombre,
      apellido,
      username,
      correo,
      numeroTelefono,
      password: hashedPassword
    });

    await newUser.save();

    const { password: _, ...userData } = newUser._doc;


    res.status(201).json({
      message: "Usuario registrado correctamente",
      user: userData
    });

  } catch (error) {
    res.status(500).json({
      message: "Error en el registro",
      error: error.message
    });
  }
};

// Login de Usuario

exports.login = async (req, res) => {
  try {
    const { correo, password } = req.body;

    if (!correo || !password) {
      return res.status(400).json({
        message: "Correo y contraseña son obligatorios"
      });
    }

    const user = await User.findOne({ correo });

    if (!user) {
      return res.status(404).json({
        message: "Usuario no encontrado, por favor verifica tu correo electronico"
      });
    }

    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) {
      return res.status(401).json({
        message: "Contraseña incorrecta"
      });
    }

    if (!process.env.JWT_SECRET) {
      throw new Error("JWT_SECRET no esta definido");
    }

    const token = jwt.sign(
      {
        id: user._id,
        esAdmin: user.esAdmin
      },
      process.env.JWT_SECRET,
      { expiresIn: "1d" }
    );

    const { password: _, ...userData } = user._doc;

    res.status(200).json({
      message: "Login exitoso",
      token,
      user: userData
    });

  } catch (error) {
    res.status(500).json({
      message: "Error en el login",
      error: error.message
    });
  }
};

// Recuperar contraseña
exports.forgotPassword = async (req, res) => {
  try {
    const { correo } = req.body;

    if (!correo) {
      return res.status(400).json({
        message: "El correo es obligatorio",
      });
    }

    const user = await User.findOne({ correo });

    if (!user) {
      return res.status(404).json({
        message: "Usuario no encontrado",
      });
    }

    // Token aleatorio
    const resetToken = crypto.randomBytes(32).toString("hex");

    // Hash para guardar en BD
    const hashedToken = crypto
      .createHash("sha256")
      .update(resetToken)
      .digest("hex");

    user.resetPasswordToken = hashedToken;

    user.resetPasswordExpire = Date.now() + 15 * 60 * 1000;

    await user.save();

    const resetUrl =
      `${process.env.FRONTEND_URL}/reset-password/${resetToken}`;

    await sendEmail({
      to: user.correo,
      subject: "Recuperación de contraseña",
      html: `
        <h2>Recuperación de contraseña</h2>

        <p>Haz clic en el siguiente enlace:</p>

        <a href="${resetUrl}">
          Restablecer contraseña
        </a>

        <p>Este enlace expirará en 15 minutos.</p>
      `,
    });

    return res.status(200).json({
      message: "Correo de recuperación enviado",
    });

  } catch (error) {
    return res.status(500).json({
      message: "Error al procesar recuperación",
      error: error.message,
    });
  }
};

// Restablecer contraseña
exports.resetPassword = async (req, res) => {
  try {
    const { token } = req.params;
    const { password } = req.body;

    if (!password) {
      return res.status(400).json({
        message: "La nueva contraseña es obligatoria",
      });
    }

    if (password.length < 8) {
      return res.status(400).json({
        message: "La contraseña debe tener mínimo 8 caracteres",
      });
    }

    const hashedToken = crypto
      .createHash("sha256")
      .update(token)
      .digest("hex");

    const user = await User.findOne({
      resetPasswordToken: hashedToken,
      resetPasswordExpire: { $gt: Date.now() },
    });

    if (!user) {
      return res.status(400).json({
        message: "Token inválido o expirado",
      });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    user.password = hashedPassword;
    user.resetPasswordToken = null;
    user.resetPasswordExpire = null;

    await user.save();

    return res.status(200).json({
      message: "Contraseña actualizada correctamente",
    });

  } catch (error) {
    return res.status(500).json({
      message: "Error al restablecer contraseña",
      error: error.message,
    });
  }
};

