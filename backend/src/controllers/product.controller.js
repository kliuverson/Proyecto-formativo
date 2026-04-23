const Product = require("../models/products.model");

// Obtener todos los productos con paginación y filtro por categoría
exports.getProducts = async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 40;
    const skip = (page - 1) * limit;
    const category = req.query.category || null; //  filtro por categoría

    const filtro = category ? { category } : {};

    const products = await Product.find(filtro).skip(skip).limit(limit);
    const baseUrl = `${req.protocol}://${req.get('host')}`;

    const productosConUrl = products.map(p => {
      const obj = p.toObject();
      obj.image = obj.image && obj.image.startsWith('http')
        ? obj.image
        : `${baseUrl}${obj.image}`;
      return obj;
    });

    const total = await Product.countDocuments(filtro);

    res.status(200).json({
      productos: productosConUrl,
      paginaActual: page,
      totalProductos: total,
      totalPaginas: Math.ceil(total / limit)
    });

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
      return res.status(404).json({ message: "Producto no encontrado" });
    }

    const baseUrl = `${req.protocol}://${req.get('host')}`;
    const obj = product.toObject();
    obj.image = obj.image && obj.image.startsWith('http')
      ? obj.image
      : `${baseUrl}${obj.image}`;

    res.status(200).json(obj);
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
    if (error.code === 11000) {
      return res.status(409).json({ message: "El SKU ya existe" });
    }
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
      { new: true, runValidators: true }
    );

    if (!updatedProduct) {
      return res.status(404).json({ message: "Producto no encontrado" });
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
      return res.status(404).json({ message: "Producto no encontrado" });
    }

    res.status(204).json({ message: "Producto eliminado correctamente" });
  } catch (error) {
    res.status(500).json({
      message: "Error al eliminar el producto",
      error: error.message
    });
  }
};