import 'package:flutter/material.dart';

class ProductoCard extends StatelessWidget {
  final String nombre;
  final String precio;

  const ProductoCard({
    super.key,
    required this.nombre,
    required this.precio,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.image, size: 60, color: Colors.grey),
          const SizedBox(height: 10),
          Text(
            nombre,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(precio),
        ],
      ),
    );
  }
}
