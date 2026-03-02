// lib/view/home/widgets/categories_grid.dart
import 'package:flutter/material.dart';
import 'package:ferremateriales/view/home/widgets/category_item.dart'; // Importa el CategoryItem que acabamos de crear

// Datos de ejemplo para las categorías
// Puedes mover esto a un lugar más centralizado si lo usas en varios sitios,
// o cargarlo desde tu API/BD.
final List<Map<String, dynamic>> categoriesData = [
  {'name': 'Herramientas', 'icon': Icons.build},
  {'name': 'Pinturas', 'icon': Icons.palette},
  {'name': 'Eléctrico', 'icon': Icons.lightbulb_outline},
  {'name': 'Construcción', 'icon': Icons.architecture},
  {'name': 'Cerrajería', 'icon': Icons.lock},
  {'name': 'Plomería', 'icon': Icons.plumbing},
  {'name': 'Medición', 'icon': Icons.straighten},
  {'name': 'Accesorios', 'icon': Icons.more_horiz},
  // ¡Añade más categorías aquí si tienes!
];

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Padding general para la sección
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row( // Fila para el título "Categorías" y el botón "Ver todas"
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categorías',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Acción para "Ver todas" las categorías
                  // Por ejemplo, navegar a una pantalla completa de categorías
                  debugPrint('Ver todas las categorías');
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoriesScreen()));
                },
                child: const Text(
                  'Ver todas',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.orange, // Color de acento para el botón
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), // Espacio entre el título y la grilla
          GridView.builder(
            shrinkWrap: true, // Esto es crucial para que la grilla funcione dentro de SingleChildScrollView
            physics: const NeverScrollableScrollPhysics(), // Deshabilita el scroll propio de la grilla
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 4 columnas como en la referencia
              crossAxisSpacing: 16.0, // Espacio horizontal entre los ítems
              mainAxisSpacing: 16.0, // Espacio vertical entre los ítems
              childAspectRatio: 0.8, // Ajusta esto para controlar la altura de cada ítem (ancho/alto)
            ),
            itemCount: categoriesData.length,
            itemBuilder: (context, index) {
              final category = categoriesData[index];
              return CategoryItem(
                name: category['name'] as String,
                icon: category['icon'] as IconData,
                onTap: () {
                  // Acción al tocar una categoría específica
                  debugPrint('Categoría seleccionada: ${category['name']}');
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailScreen(category: category)));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}