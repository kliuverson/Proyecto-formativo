
import 'package:flutter/material.dart';
import '../model/category_model.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Color accentColor;
  final Color surfaceColor;
  final Color borderColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;

  const CategoryCard({
    super.key,
    required this.category,
    required this.accentColor,
    required this.surfaceColor,
    required this.borderColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [

            /// Imagen de fondo
            Positioned.fill(
              child: Image.asset(
                category.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            /// Degradado oscuro
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(.15),
                      Colors.black.withOpacity(.85),
                    ],
                  ),
                ),
              ),
            ),

            /// Etiqueta superior
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6A14),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "Categoría",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            /// Información inferior
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    category.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
