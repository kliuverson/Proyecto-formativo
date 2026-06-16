import 'dart:convert';

import 'package:ferremateriales/view/modulos/orders/model/order_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderService {
  static const String baseUrl = "http://192.168.20.45:3000/api/orders";

  /// OBTENER PEDIDOS
  static Future<List<OrderModel>> getMyOrders() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final token = prefs.getString("token");

      final response = await http.get(
        Uri.parse("$baseUrl/my-orders"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);

          return (data['orders'] as List)
              .map((e) => OrderModel.fromJson(e))
              .toList();
        }

        // Log for debugging if not 200
        print('getMyOrders failed: ${response.statusCode} - ${response.body}');

        return [];
    } catch (e) {
      return [];
    }
  }

  /// CREAR ORDEN
  static Future<Map<String, dynamic>?> createOrder({
    required List<Map<String, dynamic>> items,
    required String paymentReference,
    required String transactionId,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final token = prefs.getString("token");

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "items": items,
          "paymentReference": paymentReference,
          "transactionId": transactionId,
        }),
      );

      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      }

      // Log for debugging
      print('Create order failed: ${response.statusCode} - ${response.body}');

      return null;
    } catch (e) {
      print(e);

      return null;
    }
  }
}