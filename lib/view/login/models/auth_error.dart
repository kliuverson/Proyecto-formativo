class AuthError {
  final String errorMessage;

  AuthError({required this.errorMessage});

  String getError() {
    if (errorMessage.contains("Invalid credentials")) {
      return "Correo o contraseña incorrectos";
    } else if (errorMessage.contains("SocketException")) {
      return "Sin conexion a internet";
    } else if (errorMessage.contains("Failed to fetch") || errorMessage.contains("ClientException")) {
      return "Sin internet o servidor no disponible";
    }else if(errorMessage.contains("Exception: Usuario no encontrado")){
      return "Correo o contraseña incorrectos";
    }else if(errorMessage.contains("Exception: Correo y contraseña son obligatorios")){
      return "Por favor ingresar todos los campos";
    }else if(errorMessage.contains("Exception: Contraseña incorrecta")){
      return "Contraseña incorrecta";
    }
    else {
      return "Error desconocido";
    }
  }
}
