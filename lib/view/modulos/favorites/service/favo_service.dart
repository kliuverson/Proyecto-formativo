// lib/view/modulos/favorites/service/favo_service.dart
import 'package:flutter/material.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart'; // Tu modelo Product

class FavoritesService extends ChangeNotifier {
  static final FavoritesService _instance = FavoritesService._internal();

  factory FavoritesService() {
    return _instance;
  }

  FavoritesService._internal();

  // Aseguramos que _favorites sea una lista mutable
  final List<Product> _favorites = [];

  // Getter para acceder a la lista de favoritos (inmutable desde fuera)
  List<Product> get favorites => List.unmodifiable(_favorites);

  void toggleFavorite(Product product) {
    // Busca si ya existe un producto con el mismo ID en la lista de favoritos
    final int existingIndex = _favorites.indexWhere((p) => p.id == product.id);

    if (existingIndex!= -1) {
      // Si el producto ya está en favoritos, lo removemos
      _favorites.removeAt(existingIndex);
      product.isFavorite = false; // Actualizamos el estado del producto
      debugPrint('Producto removido de favoritos: ${product.name}');
    } else {
      // Si el producto no está en favoritos, lo añadimos
      _favorites.add(product);
      product.isFavorite = true; // Actualizamos el estado del producto
      debugPrint('Producto añadido a favoritos: ${product.name}');
    }

    // ¡Crucial! Notifica a todos los oyentes (como AnimatedBuilder) que el estado ha cambiado.
    notifyListeners();

    // Debugging adicional para verificar el contenido del servicio
    debugPrint('FavoritesService.toggleFavorite -> count: ${_favorites.length} ids: ${_favorites.map((p) => p.id).join(',')}');
  }

  // Verifica si un producto está en favoritos
  bool isFavorite(Product product) {
    return _favorites.any((p) => p.id == product.id);
  }
}