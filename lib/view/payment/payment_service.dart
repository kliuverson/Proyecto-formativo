import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentService {

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://10.2.124.48:3000/api",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  Future<String> createPayment({
    required List<Map<String, dynamic>> items,
  }) async {

    try {

      final prefs = await SharedPreferences.getInstance();

      final token = prefs.getString("token");

      if (token == null) {
        throw Exception("Token no encontrado");
      }

      // =========================
      // CREAR ORDEN
      // =========================

      final orderResponse = await dio.post(
        "/orders",
        data: {
          "items": items,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      print("ORDER RESPONSE:");
      print(orderResponse.data);

      final orderId = orderResponse.data["order"]["_id"];
    

      // =========================
      // CREAR PAGO
      // =========================

      final paymentResponse = await dio.post(
        "/payments/create",
        data: {
          "orderId": orderId,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      print("PAYMENT RESPONSE:");
      print(paymentResponse.data);

      final checkoutUrl = paymentResponse.data["checkoutUrl"];
      final reference = paymentResponse.data["reference"];

      if (checkoutUrl == null || reference == null) {
        throw Exception("checkoutUrl o reference no encontrados");
      }

      return jsonEncode({"checkoutUrl": checkoutUrl, "reference": reference});

    } on DioException catch (e) {

      print("DIO ERROR:");
      print(e.response?.data);

      throw Exception(
        e.response?.data["message"] ??
            "Error procesando pago",
      );

    } catch (e) {

      print("GENERAL ERROR:");
      print(e);

      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> checkPaymentStatus({
    required String reference,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      final resp = await dio.get(
        "/payments/status/$reference",
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        }),
      );

      return resp.data as Map<String, dynamic>;
    } catch (e) {
      print('checkPaymentStatus error: $e');
      rethrow;
    }
  }
}