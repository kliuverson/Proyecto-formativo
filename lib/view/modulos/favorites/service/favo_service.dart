import 'package:flutter/material.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';

class FavoritesService extends ChangeNotifier {
  static final FavoritesService _instance = FavoritesService._internal();

  factory FavoritesService() {
    return _instance;
  }

  FavoritesService._internal();

  final List<Product> _favorites = [];

  List<Product> get favorites => _favorites;

  void toggleFavorite(Product product) {
    if (_favorites.any((p) => p.id == product.id)) {
      _favorites.removeWhere((p) => p.id == product.id);
      product.isFavorite = false;
    } else {
      _favorites.add(product);
      product.isFavorite = true;
    }

    try {
      print(
        'FavoritesService.toggleFavorite -> count: ${_favorites.length} ids: ${_favorites.map((p) => p.id).join(',')}',
      );
    } catch (_) {}

    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favorites.any((p) => p.id == product.id);
  }
}
