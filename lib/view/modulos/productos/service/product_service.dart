import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';

class ProductService {
  static const String baseUrl = 'http://192.168.1.17:3000';

  static Future<List<ProductModel>> getProducts({
    int page = 1,
    int limit = 40,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      final response = await http.get(
        Uri.parse('$baseUrl/api/products?page=$page&limit=$limit'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> lista = data['productos'];
        return lista.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  // 👇 Ahora filtra directo desde el backend
  static Future<List<ProductModel>> getProductsByCategory(
    String category, {
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      final response = await http.get(
        Uri.parse(
          '$baseUrl/api/products?page=$page&limit=$limit&category=$category',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> lista = data['productos'];
        return lista.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  static Future<void> createProduct(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await http.post(
      Uri.parse('$baseUrl/api/products'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 201) {
      final resData = jsonDecode(response.body);
      throw Exception(resData["message"]);
    }
  }

  static List<ProductModel> getStaticProducts() => [];
}
