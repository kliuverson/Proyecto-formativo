
import 'package:flutter/material.dart';

class AcercaDeNosotrosPage extends StatelessWidget {
  const AcercaDeNosotrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Acerca de Nosotros")),
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
                  "Acerca de Nosotros",
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
            "Ferremateriales DGC · Desde 2010",
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
          const SizedBox(height: 20),
          _Seccion(
            titulo: "¿Quiénes somos?",
            contenido:
                "Ferremateriales DGC es una empresa colombiana dedicada a la venta de materiales de construcción, herramientas y acabados para el hogar. Nacimos con el propósito de acercar los mejores productos del sector ferretero a nuestros clientes de forma rápida y confiable.",
          ),
          _Seccion(
            titulo: "Nuestra misión",
            contenido:
                "Proveer materiales de construcción y ferretería de alta calidad, ofreciendo una experiencia de compra ágil, segura y accesible, tanto en nuestra tienda física como a través de nuestra aplicación móvil.",
          ),
          _Seccion(
            titulo: "Nuestra visión",
            contenido:
                "Ser la ferretería de referencia en la región, reconocida por la calidad de nuestros productos, la excelencia en el servicio al cliente y nuestra capacidad de innovación digital.",
          ),
          _Seccion(
            titulo: "Nuestros valores",
            contenido:
                "Confianza, honestidad y compromiso guían cada una de nuestras acciones. Creemos en relaciones duraderas con nuestros clientes, proveedores y colaboradores, basadas en el respeto y la transparencia.",
          ),
          _Seccion(
            titulo: "¿Por qué elegirnos?",
            contenido:
                "Contamos con un amplio catálogo de productos, precios competitivos, asesoría personalizada y entregas a domicilio. Nuestra app te permite explorar categorías, gestionar tus pedidos y contactarnos en cualquier momento.",
          ),
          _Seccion(
            titulo: "Contáctanos",
            contenido:
                "¿Tienes alguna pregunta o sugerencia? Escríbenos a contacto@ferremateriales.com o visítanos en nuestra tienda. Estamos aquí para ayudarte.",
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

