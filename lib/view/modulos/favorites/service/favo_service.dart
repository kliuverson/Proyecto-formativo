import 'package:flutter/material.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';

class FavoritesService extends ChangeNotifier {
  static final FavoritesService _instance = FavoritesService._internal();

  factory FavoritesService() {
    return _instance;
  }

  FavoritesService._internal();

  final List<ProductModel> _favorites = [];

  List<ProductModel> get favorites => List.unmodifiable(_favorites);

  void toggleFavorite(ProductModel product) {
    final index =
        _favorites.indexWhere((p) => p.sku == product.sku);

    if (index != -1) {
      _favorites.removeAt(index);
    } else {
      _favorites.add(product);
    }

    notifyListeners();
  }

  bool isFavorite(ProductModel product) {
    return _favorites.any((p) => p.sku == product.sku);
  }
}