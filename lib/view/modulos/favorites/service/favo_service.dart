import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ferremateriales/view/modulos/productos/model/product.dart';

class FavoritesService extends ChangeNotifier {
  static final FavoritesService _instance =
      FavoritesService._internal();

  factory FavoritesService() => _instance;

  FavoritesService._internal();

  final List<ProductModel> _favorites = [];

  List<ProductModel> get favorites =>
      List.unmodifiable(_favorites);

  final String baseUrl =
      "http://192.168.20.45:3000/api/favorites";

  String _token = "";

  // =========================
  // TOKEN
  // =========================
  Future<void> _loadToken() async {
    final prefs =
        await SharedPreferences.getInstance();

    _token = prefs.getString('token') ?? "";

    if (_token.isEmpty) {
      debugPrint(
        "TOKEN VACÍO EN FAVORITES SERVICE",
      );
    }
  }

  Future<Map<String, String>> _headers() async {
    await _loadToken();

    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $_token",
    };
  }

  // =========================
  // CARGAR FAVORITOS
  // =========================
  Future<void> loadFavorites() async {
    try {
      final headers = await _headers();

      final response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      debugPrint(
        "LOAD FAVORITES STATUS: ${response.statusCode}",
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        _favorites.clear();

        final items = data["items"] ?? [];

        for (var item in items) {
          if (item["productId"] != null) {
            _favorites.add(
              ProductModel.fromJson(
                item["productId"],
              ),
            );
          }
        }

        debugPrint(
          "FAVORITOS CARGADOS: ${_favorites.length}",
        );

        notifyListeners();
      } else {
        debugPrint(
          "ERROR LOAD FAVORITES: ${response.body}",
        );
      }
    } catch (e) {
      debugPrint(
        "ERROR LOAD FAVORITES: $e",
      );
    }
  }

  // =========================
  // TOGGLE FAVORITO
  // =========================
  Future<void> toggleFavorite(
    ProductModel product,
  ) async {
    try {
      final headers = await _headers();

      final productId = product.id;

      if (productId == null ||
          productId.toString().isEmpty) {
        debugPrint("PRODUCT ID INVALIDO");
        return;
      }

      final exists = isFavorite(product);

      // =========================
      // ELIMINAR FAVORITO
      // =========================
      if (exists) {
        final response = await http.delete(
          Uri.parse(
            "$baseUrl/item/$productId",
          ),
          headers: headers,
        );

        debugPrint(
          "DELETE FAVORITE STATUS: ${response.statusCode}",
        );

        debugPrint(response.body);

        if (response.statusCode == 200 ||
            response.statusCode == 204) {
          // RECARGAR FAVORITOS DESDE BACKEND
          await loadFavorites();
        } else {
          debugPrint(
            "ERROR DELETE: ${response.body}",
          );
        }
      }

      // =========================
      // AGREGAR FAVORITO
      // =========================
      else {
        final response = await http.post(
          Uri.parse("$baseUrl/add"),
          headers: headers,
          body: jsonEncode({
            "productId": productId,
          }),
        );

        debugPrint(
          "ADD FAVORITE STATUS: ${response.statusCode}",
        );

        debugPrint(response.body);

        if (response.statusCode == 200 ||
            response.statusCode == 201) {
          // RECARGAR FAVORITOS DESDE BACKEND
          await loadFavorites();
        } else {
          debugPrint(
            "ERROR ADD: ${response.body}",
          );
        }
      }
    } catch (e) {
      debugPrint(
        "ERROR TOGGLE FAVORITE: $e",
      );
    }
  }

  // =========================
  // VERIFICAR FAVORITO
  // =========================
  bool isFavorite(ProductModel product) {
    return _favorites.any(
      (p) => p.id == product.id,
    );
  }

  // =========================
  // LIMPIAR FAVORITOS
  // =========================
  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }
}