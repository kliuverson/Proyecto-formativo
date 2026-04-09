import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "http://172.37.197.68:3000/api/auth";

  Future<Map<String, dynamic>> login(String correo, String password) async {
    final url = Uri.parse("$baseUrl/login");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"correo": correo, "password": password}),
    );

    final data = jsonDecode(response.body);

    if(response.statusCode == 200){
      return data;
    }else{
      throw Exception(data["message"] ?? "Error en el login");
    }

    
  }
}
