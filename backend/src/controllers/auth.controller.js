const User = require("../models/user.model");

const bcrypt = require("bcrypt");

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
    if (!nombre || !apellido || !username || !correo || !numeroTelefono || !password) {
      return res.status(400).json({
        message: "Todos los campos son obligatorios"
      });
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

    res.status(201).json({
      message: "Usuario registrado correctamente"
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
        message: "Usuario no encontrado"
      });
    }

    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) {
      return res.status(401).json({
        message: "Contraseña incorrecta"
      });
    }

    if(!process.env.JWT_SECRET){
        throw new Error("JWT_SECRET no esta definido");
    }

    const token = jwt.sign(
      {
        id: user._id,
        role: user.role
      },
      process.env.JWT_SECRET,
      { expiresIn: "1d" }
    );

    res.status(200).json({
      message: "Login exitoso",
      token,
      user: {
        id: user._id,
        nombre: user.nombre,
        correo: user.correo,
        role: user.role
      }
    });

  } catch (error) {
    res.status(500).json({
      message: "Error en el login",
      error: error.message
    });
  }
};

