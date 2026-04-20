import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // 👈 agregar
import 'package:ferremateriales/view/modulos/productos/model/product.dart';

class ProductService {
  static const String baseUrl = 'http://192.168.1.2:3000';

  static Future<List<ProductModel>> getProducts() async {
    try {
      // 👇 Obtener el token guardado
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      final response = await http.get(
        Uri.parse('$baseUrl/api/products'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // 👈 enviar token
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  static Future<List<ProductModel>> getProductsByCategory(String category) async {
    final products = await getProducts();
    return products.where((p) => p.category == category).toList();
  }

  static List<ProductModel> getStaticProducts() => [];
}