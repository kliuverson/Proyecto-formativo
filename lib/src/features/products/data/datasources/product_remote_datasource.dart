import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> fetchProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> fetchProducts() async {
    // Implementación de ejemplo — reemplazar por llamada real
    final response = await client.get(Uri.parse('https://api.example.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> decoded = json.decode(response.body);
      return decoded.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('Error al traer productos');
    }
  }
}
