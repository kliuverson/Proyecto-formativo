const Favorite = require("../models/favorite.model");
const Product = require("../models/products.model"); // CORRECTO

// =========================
// OBTENER FAVORITOS
// =========================
exports.getFavorites = async (req, res) => {
  try {
    const userId = req.user.id;

    let favorites = await Favorite.findOne({ userId }).populate({
      path: "items.productId",
      model: "Product",
    });

    // si no existe, crear lista vacía
    if (!favorites) {
      favorites = await Favorite.create({
        userId,
        items: [],
      });
    }

    return res.status(200).json({
      items: favorites.items,
    });
  } catch (error) {
    console.error(error);

    return res.status(500).json({
      message: "Error al obtener favoritos",
      error: error.message,
    });
  }
};

// =========================
// AGREGAR FAVORITO
// =========================
exports.addFavorite = async (req, res) => {
  try {
    const userId = req.user.id;
    const { productId } = req.body;

    if (!productId) {
      return res.status(400).json({
        message: "productId es requerido",
      });
    }

    const productExists = await Product.findById(productId);

    if (!productExists) {
      return res.status(404).json({
        message: "Producto no encontrado",
      });
    }

    let favorites = await Favorite.findOne({ userId });

    if (!favorites) {
      favorites = await Favorite.create({
        userId,
        items: [],
      });
    }

    // EVITAR DUPLICADOS
    const alreadyExists = favorites.items.some((item) => {
      if (item.productId && item.productId._id) {
        return item.productId._id.toString() === productId;
      }
      return item.productId.toString() === productId;
    });

    if (alreadyExists) {
      return res.status(200).json({
        message: "El producto ya está en favoritos",
        items: favorites.items,
      });
    }

    favorites.items.push({ productId });

    await favorites.save();

    await favorites.populate({
      path: "items.productId",
      model: "Product",
    });

    return res.status(200).json({
      message: "Producto agregado a favoritos",
      items: favorites.items,
    });
  } catch (error) {
    console.error(error);

    return res.status(500).json({
      message: "Error al agregar favorito",
      error: error.message,
    });
  }
};

// =========================
// ELIMINAR FAVORITO
// =========================
exports.removeFavorite = async (req, res) => {
  try {
    const userId = req.user.id;
    const { productId } = req.params;

    const favorites = await Favorite.findOne({ userId });

    if (!favorites) {
      return res.status(404).json({
        message: "No hay favoritos",
      });
    }

    favorites.items = favorites.items.filter((item) => {
      if (item.productId && item.productId._id) {
        return item.productId._id.toString() !== productId;
      }
      return item.productId.toString() !== productId;
    });

    await favorites.save();

    await favorites.populate({
      path: "items.productId",
      model: "Product",
    });

    return res.status(200).json({
      message: "Producto eliminado de favoritos",
      items: favorites.items,
    });
  } catch (error) {
    console.error(error);

    return res.status(500).json({
      message: "Error al eliminar favorito",
      error: error.message,
    });
  }
};

// =========================
// LIMPIAR FAVORITOS
// =========================
exports.clearFavorites = async (req, res) => {
  try {
    const userId = req.user.id;

    const favorites = await Favorite.findOne({ userId });

    if (!favorites) {
      return res.status(404).json({
        message: "No hay favoritos",
      });
    }

    favorites.items = [];

    await favorites.save();

    return res.status(200).json({
      message: "Favoritos eliminados correctamente",
      items: [],
    });
  } catch (error) {
    console.error(error);

    return res.status(500).json({
      message: "Error al limpiar favoritos",
      error: error.message,
    });
  }
};