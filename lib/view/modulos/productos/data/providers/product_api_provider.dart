import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ProductApiProvider {
  final String baseUrl = "http://localhost:3000"; // tu backend

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/productos"));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Error al cargar productos");
    }
  }
}