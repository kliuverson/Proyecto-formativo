import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';

class FavoritesService extends ChangeNotifier {
  static final FavoritesService _instance = FavoritesService._internal();

  factory FavoritesService() => _instance;
  FavoritesService._internal();

  static const String baseUrl = 'http://192.168.20.45:3000';

  final List<ProductModel> _favorites = [];
  bool _isLoading = false;

  List<ProductModel> get favorites => List.unmodifiable(_favorites);
  bool get isLoading => _isLoading;

  // ─── Obtener token ───────────────────────────────────────────
  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Map<String, String> _headers(String token) => {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  // ─── Cargar favoritos desde la BD ────────────────────────────
  Future<void> loadFavorites() async {
    try {
      _isLoading = true;
      notifyListeners();

      final token = await _getToken();

      final response = await http.get(
        Uri.parse('$baseUrl/api/favorites'),
        headers: _headers(token),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> items = data['items'] ?? [];

        _favorites.clear();

        for (final item in items) {
          // El populate trae el producto en 'productId'
          final productData = item['productId'];
          if (productData != null && productData is Map<String, dynamic>) {
            _favorites.add(ProductModel.fromJson(productData));
          }
        }
      }
    } catch (e) {
      debugPrint('Error al cargar favoritos: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ─── Toggle: agrega o elimina según estado actual ────────────
  Future<void> toggleFavorite(ProductModel product) async {
    final isFav = isFavorite(product);

    // Actualización optimista en UI
    if (isFav) {
      _favorites.removeWhere((p) => p.sku == product.sku);
    } else {
      _favorites.add(product);
    }
    notifyListeners();

    try {
      final token = await _getToken();

      if (isFav) {
        // Eliminar del backend — necesita el _id de MongoDB
        final mongoId = product.id; // ver nota abajo
        final response = await http.delete(
          Uri.parse('$baseUrl/api/favorites/item/$mongoId'),
          headers: _headers(token),
        );

        if (response.statusCode != 200) {
          // Revertir si falló
          _favorites.add(product);
          notifyListeners();
          debugPrint('Error al eliminar favorito: ${response.body}');
        }
      } else {
        // Agregar al backend
        final response = await http.post(
          Uri.parse('$baseUrl/api/favorites/add'),
          headers: _headers(token),
          body: jsonEncode({'productId': product.id}),
        );

        if (response.statusCode != 200) {
          // Revertir si falló
          _favorites.removeWhere((p) => p.sku == product.sku);
          notifyListeners();
          debugPrint('Error al agregar favorito: ${response.body}');
        }
      }
    } catch (e) {
      // Revertir cambio optimista si hubo excepción
      if (isFav) {
        _favorites.add(product);
      } else {
        _favorites.removeWhere((p) => p.sku == product.sku);
      }
      notifyListeners();
      debugPrint('Error en toggleFavorite: $e');
    }
  }

  bool isFavorite(ProductModel product) {
    return _favorites.any((p) => p.sku == product.sku);
  }
}
