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
              child: Image.asset(
                category.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  category.name,
                  style: TextStyle(
                    color: textPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  category.description,
                  style: TextStyle(
                    color: textSecondaryColor,
                    fontSize: 12,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}