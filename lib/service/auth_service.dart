import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = "http://192.168.1.17:3000/api/auth";

  Future<Map<String, dynamic>> login(String correo, String password) async {
    final url = Uri.parse("$baseUrl/login");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"correo": correo, "password": password}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // 👇 Guardar el token
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', data['token']);
      return data;
    } else {
      throw Exception(data["message"] ?? "Error en el login");
    }
  }

  Future<Map<String, dynamic>> register(
    String nombre,
    String apellido,
    String nombreUsuario,
    String correo,
    String telefono,
    String password,
  ) async {
    final url = Uri.parse("$baseUrl/register");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nombre": nombre,
        "apellido": apellido,
        "username": nombreUsuario,
        "correo": correo,
        "numeroTelefono": telefono,
        "password": password,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return data;
    } else {
      if (data["errors"] != null) {
        throw data["errors"];
      }
      throw Exception(data["message"] ?? "Error en el registro");
    }
  }
}