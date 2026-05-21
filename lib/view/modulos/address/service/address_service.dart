import 'dart:convert';

import 'package:ferremateriales/view/modulos/address/model/address_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddressService {

  /// URL BACKEND
  final String baseUrl =
      "http://10.2.125.182:3000/api/address";

  /// OBTENER TOKEN
  Future<String?> getToken() async {

    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("token");
  }

  /// HEADERS
  Future<Map<String, String>> getHeaders() async {

    final token = await getToken();

    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  /// OBTENER DIRECCIONES
  Future<List<AddressModel>> getAddresses() async {

    print("OBTENIENDO DIRECCIONES...");

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: await getHeaders(),
    );

    print("GET STATUS: ${response.statusCode}");
    print("GET BODY: ${response.body}");

    if (response.statusCode == 200) {

      final List data = jsonDecode(response.body);

      return data
          .map(
            (e) => AddressModel.fromJson(e),
          )
          .toList();
    }

    final data = jsonDecode(response.body);

    throw Exception(
      data["message"] ??
          "Error al obtener direcciones",
    );
  }

  /// CREAR DIRECCIÓN
  Future<void> createAddress(
    AddressModel address,
  ) async {

    print("CREANDO DIRECCIÓN...");
    print(address.toJson());

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: await getHeaders(),
      body: jsonEncode(address.toJson()),
    );

    print("POST STATUS: ${response.statusCode}");
    print("POST BODY: ${response.body}");

    if (response.statusCode != 201) {

      final data = jsonDecode(response.body);

      throw Exception(
        data["message"] ??
            "Error al crear dirección",
      );
    }
  }

  /// ACTUALIZAR DIRECCIÓN
  Future<void> updateAddress(
    String id,
    AddressModel address,
  ) async {

    print("ACTUALIZANDO DIRECCIÓN...");
    print(address.toJson());

    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: await getHeaders(),
      body: jsonEncode(address.toJson()),
    );

    print("PUT STATUS: ${response.statusCode}");
    print("PUT BODY: ${response.body}");

    if (response.statusCode != 200) {

      final data = jsonDecode(response.body);

      throw Exception(
        data["message"] ??
            "Error al actualizar dirección",
      );
    }
  }

  /// ELIMINAR DIRECCIÓN
  Future<void> deleteAddress(
    String id,
  ) async {

    print("ELIMINANDO DIRECCIÓN...");

    final response = await http.delete(
      Uri.parse("$baseUrl/$id"),
      headers: await getHeaders(),
    );

    print("DELETE STATUS: ${response.statusCode}");
    print("DELETE BODY: ${response.body}");

    if (response.statusCode != 200) {

      final data = jsonDecode(response.body);

      throw Exception(
        data["message"] ??
            "Error al eliminar dirección",
      );
    }
  }

  /// ESTABLECER DIRECCIÓN PRINCIPAL
  Future<void> setPrincipalAddress(
    String id,
  ) async {

    print("ACTUALIZANDO DIRECCIÓN PRINCIPAL...");

    final response = await http.patch(
      Uri.parse("$baseUrl/$id/principal"),
      headers: await getHeaders(),
    );

    print("PATCH STATUS: ${response.statusCode}");
    print("PATCH BODY: ${response.body}");

    if (response.statusCode != 200) {

      final data = jsonDecode(response.body);

      throw Exception(
        data["message"] ??
            "Error al actualizar dirección principal",
      );
    }
  }
}