// lib/view/home/widgets/category_item.dart
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback? onTap; // Agregamos un callback para cuando se toque

  const CategoryItem({
    super.key,
    required this.name,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Llama al callback cuando se toca
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100], // Fondo sutil para el icono
              borderRadius: BorderRadius.circular(10), // Bordes ligeramente redondeados
            ),
            child: Icon(icon, size: 30, color: Colors.black87), // Icono de la categoría
          ),
          const SizedBox(height: 8), // Espacio entre el icono y el texto
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
            maxLines: 1, // Para evitar que el texto sea demasiado largo
            overflow: TextOverflow.ellipsis, // Si el texto es largo, lo corta con "..."
          ),
        ],
      ),
    );
  }
}