// dashboard_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardService {
  final String baseUrl = "http://192.168.1.17:3000/api/dashboard";

  Future<Map<String, dynamic>> getDashboardData(String token) async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",   // ✅ requiere auth + admin
      },
    );

    if (response.statusCode == 200) {
      return Map<String, dynamic>.from(jsonDecode(response.body) as Map);
    } else {
      final body = jsonDecode(response.body);
      throw Exception(body["message"] ?? "Error obteniendo dashboard");
    }
  }
}