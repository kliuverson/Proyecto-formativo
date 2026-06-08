import 'package:flutter/material.dart';

class TerminosPage extends StatelessWidget {
  const TerminosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Términos y condiciones")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4B740).withOpacity(0.18),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "Términos y condiciones",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF4B740),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Última actualización: junio 2025",
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
          const SizedBox(height: 20),
          _Seccion(
            titulo: "1. Aceptación de los términos",
            contenido:
                "Al usar esta aplicación, aceptas estos términos en su totalidad. Si no estás de acuerdo, por favor no uses el servicio.",
          ),
          _Seccion(
            titulo: "2. Uso del servicio",
            contenido:
                "Esta plataforma es exclusiva para la compra de productos de ferretería y materiales de construcción. Queda prohibido el uso indebido o con fines ilícitos.",
          ),
          _Seccion(
            titulo: "3. Cuenta de usuario",
            contenido:
                "Eres responsable de mantener la confidencialidad de tus credenciales. Notifícanos de inmediato ante cualquier uso no autorizado de tu cuenta.",
          ),
          _Seccion(
            titulo: "4. Precios y pagos",
            contenido:
                "Los precios están expresados en pesos colombianos e incluyen IVA. Nos reservamos el derecho de modificar precios sin previo aviso.",
          ),
          _Seccion(
            titulo: "5. Cancelaciones y devoluciones",
            contenido:
                "Puedes cancelar un pedido antes de su despacho. Las devoluciones se gestionan dentro de los 5 días hábiles siguientes a la entrega.",
          ),
          _Seccion(
            titulo: "6. Contacto",
            contenido:
                "Para consultas sobre estos términos escríbenos a legal@ferremateriales.com.",
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
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF4B740),
            ),
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

