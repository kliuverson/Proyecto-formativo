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
        color: surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Stack(
                children: [

                  // IMAGEN
                  Positioned.fill(
                    child: Image.asset(
                      category.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),

                  //  DEGRADADO 
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),

                  //  TEXTO ENCIMA DE LA IMAGEN
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          category.description,
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
          ),

        ],
      ),
    );
  }
}