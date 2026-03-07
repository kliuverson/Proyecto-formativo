import 'package:flutter/material.dart';
import '../model/category_data.dart';
import 'category_card.dart';

class CategoryGrid extends StatelessWidget {

  final Color accentColor;
  final Color surfaceColor;
  final Color borderColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;

  const CategoryGrid({
    super.key,
    required this.accentColor,
    required this.surfaceColor,
    required this.borderColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
  });

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {

        return CategoryCard(
          category: categories[index],
          accentColor: accentColor,
          surfaceColor: surfaceColor,
          borderColor: borderColor,
          textPrimaryColor: textPrimaryColor,
          textSecondaryColor: textSecondaryColor,
        );

      },
    );
  }
}