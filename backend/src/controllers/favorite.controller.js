const Favorite = require("../models/favorite.model");
const Product = require("../models/products.model");


// Obtener favoritos del usuario
exports.getFavorites = async (req, res) => {
  try {

    const userId = req.user.id;

    let favorites = await Favorite.findOne({ userId })
      .populate({ path: "items.productId", model: "productos" });

    // Si no existe, crear lista vacía
    if (!favorites) {
      favorites = await Favorite.create({
        userId,
        items: [],
      });
    }

    // Construir URL completa de la imagen igual que en getProducts
    const baseUrl = `${req.protocol}://${req.get('host')}`;

    const itemsConUrl = favorites.items.map(item => {
      const obj = item.toObject();
      if (obj.productId && obj.productId.image) {
        obj.productId.image = obj.productId.image.startsWith('http')
          ? obj.productId.image
          : `${baseUrl}${obj.productId.image}`;
      }
      return obj;
    });

    res.status(200).json({
      ...favorites.toObject(),
      items: itemsConUrl,
    });

  } catch (error) {

    res.status(500).json({
      message: "Error al obtener favoritos",
      error: error.message,
    });

  }
};


// Agregar producto a favoritos
exports.addFavorite = async (req, res) => {
  try {

    const userId = req.user.id;
    const { productId } = req.body;

    if (!productId) {
      return res.status(400).json({
        message: "productId es requerido",
      });
    }

    // Validar si existe el producto
    const productExists = await Product.findById(productId);

    if (!productExists) {
      return res.status(404).json({
        message: "Producto no encontrado",
      });
    }

    let favorites = await Favorite.findOne({ userId });

    // Si no existe lista, crearla
    if (!favorites) {
      favorites = await Favorite.create({
        userId,
        items: [],
      });
    }

    // Verifica duplicados
    const alreadyExists = favorites.items.find(
      (item) => item.productId.toString() === productId
    );

    if (alreadyExists) {
      return res.status(400).json({
        message: "El producto ya está en favoritos",
      });
    }

    favorites.items.push({ productId });

    await favorites.save();

    // Retornar con populate
    await favorites.populate({ path: "items.productId", model: "productos" });

    // Construir URL completa de la imagen
    const baseUrl = `${req.protocol}://${req.get('host')}`;

    const itemsConUrl = favorites.items.map(item => {
      const obj = item.toObject();
      if (obj.productId && obj.productId.image) {
        obj.productId.image = obj.productId.image.startsWith('http')
          ? obj.productId.image
          : `${baseUrl}${obj.productId.image}`;
      }
      return obj;
    });

    res.status(200).json({
      message: "Producto agregado a favoritos",
      favorites: {
        ...favorites.toObject(),
        items: itemsConUrl,
      },
    });

  } catch (error) {

    res.status(500).json({
      message: "Error al agregar favorito",
      error: error.message,
    });

  }
};


// Elimina producto de favoritos
exports.removeFavorite = async (req, res) => {
  try {

    const userId = req.user.id;
    const { productId } = req.params;

    if (!productId) {
      return res.status(400).json({
        message: "productId es requerido",
      });
    }

    const favorites = await Favorite.findOne({ userId });

    if (!favorites) {
      return res.status(404).json({
        message: "Lista de favoritos no encontrada",
      });
    }

    const beforeCount = favorites.items.length;

    favorites.items = favorites.items.filter(
      (item) => item.productId.toString() !== productId
    );

    if (favorites.items.length === beforeCount) {
      return res.status(404).json({
        message: "Producto no encontrado en favoritos",
      });
    }

    await favorites.save();

    res.status(200).json({
      message: "Producto eliminado de favoritos",
      favorites,
    });

  } catch (error) {

    res.status(500).json({
      message: "Error al eliminar favorito",
      error: error.message,
    });

  }
};


// Vaciar favoritos
exports.clearFavorites = async (req, res) => {
  try {

    const userId = req.user.id;

    const favorites = await Favorite.findOne({ userId });

    if (!favorites) {
      return res.status(404).json({
        message: "Lista de favoritos no encontrada",
      });
    }

    favorites.items = [];

    await favorites.save();

    res.status(200).json({
      message: "Favoritos eliminados correctamente",
    });

  } catch (error) {

    res.status(500).json({
      message: "Error al limpiar favoritos",
      error: error.message,
    });

  }
};

