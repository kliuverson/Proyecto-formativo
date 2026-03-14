import 'package:flutter/material.dart';
import 'package:ferremateriales/view/modulos/category/model/category_data.dart';
import 'package:ferremateriales/view/modulos/category/widgets/category_card.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    final accentColor = theme.colorScheme.primary;
    final surfaceColor = theme.colorScheme.surface;
    final borderColor = Colors.grey.shade300;
    final textPrimaryColor = theme.textTheme.bodyLarge!.color!;
    final textSecondaryColor = theme.textTheme.bodyMedium!.color!;

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
        final category = categories[index];

        return CategoryCard(
          category: category,
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
