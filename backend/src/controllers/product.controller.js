const Product = require("../models/products.model");

// Obtener todos los productos
exports.getProducts = async (req, res) => {
  try {

    const products = await Product.find();

    res.status(200).json(products);

  } catch (error) {

    res.status(500).json({
      message: "Error al obtener los productos",
      error: error.message
    });

  }
};


// Obtener producto por ID
exports.getProductById = async (req, res) => {
  try {

    const product = await Product.findById(req.params.id);

    if (!product) {
      return res.status(404).json({
        message: "Producto no encontrado"
      });
    }

    res.status(200).json(product);

  } catch (error) {

    res.status(500).json({
      message: "Error al obtener el producto",
      error: error.message
    });

  }
};


// Crear producto
exports.createProduct = async (req, res) => {
  try {

    const newProduct = new Product(req.body);

    const savedProduct = await newProduct.save();

    res.status(201).json(savedProduct);

  } catch (error) {

    res.status(400).json({
      message: "Error al crear el producto",
      error: error.message
    });

  }
};


// Actualizar producto
exports.updateProduct = async (req, res) => {
  try {

    const updatedProduct = await Product.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );

    if (!updatedProduct) {
      return res.status(404).json({
        message: "Producto no encontrado"
      });
    }

    res.status(200).json(updatedProduct);

  } catch (error) {

    res.status(400).json({
      message: "Error al actualizar el producto",
      error: error.message
    });

  }
};


// Eliminar producto
exports.deleteProduct = async (req, res) => {
  try {

    const deletedProduct = await Product.findByIdAndDelete(req.params.id);

    if (!deletedProduct) {
      return res.status(404).json({
        message: "Producto no encontrado"
      });
    }

    res.status(204).json({
      message: "Producto eliminado correctamente"
    });

  } catch (error) {

    res.status(500).json({
      message: "Error al eliminar el producto",
      error: error.message
    });

  }
};