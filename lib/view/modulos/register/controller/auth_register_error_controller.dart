class AuthRegisterError {
  final dynamic error;

  AuthRegisterError(this.error);

  String getErrorMessage() {
    try {
      final errorString = error.toString();

      if (errorString.contains("Failed to fetch")) {
        return "Servidor no disponible";
      }

      if (errorString.contains("SocketException")) {
        return "Sin conexión a internet";
      }

      // Extraer mensaje del Exception
      final cleaned = errorString.replaceAll("Exception: ", "");

      return cleaned;
    } catch (_) {
      return "Error inesperado";
    }
  }
}