import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class ApiConfig {
  /// Devuelve el host base para el API según la plataforma.
  /// - Android emulator: 10.0.2.2
  /// - Web / iOS / Desktop: localhost
  /// - Physical Android device: debe usarse la IP de la máquina (no manejada automáticamente).
  static String get baseHost {
    if (kIsWeb) return 'http://localhost:3000';

    try {
      if (Platform.isAndroid) return 'http://10.0.2.2:3000';
      return 'http://localhost:3000';
    } catch (_) {
      return 'http://localhost:3000';
    }
  }
}
