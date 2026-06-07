import 'package:flutter/material.dart';

class PrivacidadPage extends StatelessWidget {
  const PrivacidadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Política de privacidad")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Política de privacidad",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            "Última actualización: junio 2025",
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
          const SizedBox(height: 20),
          _Seccion(
            titulo: "Datos que recopilamos",
            contenido:
                "Recopilamos nombre, correo electrónico, dirección de entrega y datos de uso de la app para brindarte una mejor experiencia.",
          ),
          _Seccion(
            titulo: "Uso de la información",
            contenido:
                "Usamos tus datos para procesar pedidos, personalizar tu experiencia y enviarte notificaciones relevantes. Nunca vendemos tu información a terceros.",
          ),
          _Seccion(
            titulo: "Almacenamiento y seguridad",
            contenido:
                "Tu información se almacena en servidores seguros con cifrado. Aplicamos medidas técnicas y organizativas para proteger tus datos.",
          ),
          _Seccion(
            titulo: "Tus derechos",
            contenido:
                "Tienes derecho a acceder, corregir o eliminar tus datos personales. Puedes ejercerlos escribiéndonos a privacidad@ferremateriales.com.",
          ),
          _Seccion(
            titulo: "Cookies",
            contenido:
                "Usamos cookies para mejorar el rendimiento de la app. Puedes desactivarlas desde la configuración de tu dispositivo.",
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _Seccion extends StatelessWidget {
  final String titulo;
  final String contenido;

  const _Seccion({required this.titulo, required this.contenido});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            contenido,
            style: TextStyle(fontSize: 13, color: Colors.grey[700], height: 1.6),
          ),
        ],
      ),
    );
  }
}