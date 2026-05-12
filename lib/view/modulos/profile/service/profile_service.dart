import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  final String baseUrl = "http://192.168.1.17:3000/api/user";

  Future<Map<String, dynamic>> getUserProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      if (token.isEmpty) {
        throw Exception("Sesión expirada, por favor inicia sesión nuevamente.");
      }

      final response = await http.get(
        Uri.parse('$baseUrl/profile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data["message"]);
      }
    } catch (e) {
      print("Error profile: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateUserProfile({
    required String nombre,
    required String apellido,
    required String username,
    required String correo,
    required String numeroTelefono,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      if (token.isEmpty) {
        throw Exception("Sesion Expirada, por favor inicia sesión nuevamente.");
      }

      final response = await http.put(
        Uri.parse('$baseUrl/profile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "nombre": nombre,
          "apellido": apellido,
          "username": username,
          "correo": correo,
          "numeroTelefono": numeroTelefono,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      }

      if (response.statusCode == 400 || response.statusCode == 409) {
        throw Exception(jsonEncode(data));
      }

      throw Exception(data["message"] ?? "Error al actualizar el perfil");
    } catch (e) {
      print("Error al actualizar el perfil: $e");
      rethrow;
    }
  }
}
