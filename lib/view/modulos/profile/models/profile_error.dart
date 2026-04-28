import 'dart:convert';

class ProfileErrorMessage {
  final String errorMessage;

  ProfileErrorMessage({required this.errorMessage});

  String getError() {
    /// INTERNET
    if (errorMessage.contains("SocketException")) {
      return "Sin conexión a internet";
    }

    if (errorMessage.contains("ClientException") ||
        errorMessage.contains("Failed host lookup")) {
      return "Servidor no disponible";
    }

    /// SESIÓN
    if (errorMessage.contains("Sesión expirada") ||
        errorMessage.contains("Sesion Expirada")) {
      return "Tu sesión expiró, inicia sesión nuevamente";
    }

    try {
      final clean = errorMessage.replaceFirst("Exception: ", "");
      final decoded = jsonDecode(clean);

      /// ARRAY DE ERRORES
      if (decoded["errors"] != null) {
        final errors = decoded["errors"] as List;

        if (errors.isNotEmpty) {
          final first = errors.first;

          final field = first["field"] ?? "";
          final message = first["message"] ?? "";

          /// CORREO
          if (field == "correo") {
            if (message.contains("uso")) {
              return "Ese correo ya está registrado";
            }
            return "Correo electrónico inválido";
          }

          /// USERNAME
          if (field == "username") {
            if (message.contains("uso")) {
              return "Ese nombre de usuario ya existe";
            }
            return "Nombre de usuario inválido";
          }

          /// TELÉFONO
          if (field == "numeroTelefono") {
            return "Número telefónico inválido";
          }

          /// NOMBRE
          if (field == "nombre") {
            return "Nombre inválido";
          }

          return message;
        }
      }

      /// MENSAJE SIMPLE
      if (decoded["message"] != null) {
        return decoded["message"];
      }
    } catch (_) {}

    return "No se pudo actualizar el perfil";
  }
}
