
import 'package:ferremateriales/src/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../model/category_data.dart';
import 'category_card.dart';

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const Text(
              "Categorías",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.category,
                );
              },
              child: const Text(
                "Ver todas",
                style: TextStyle(
                  color: Color(0xFFFF6A14),
                  fontWeight: FontWeight.w600,
                ),
              ),
            )

          ],
        ),

        const SizedBox(height: 12),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,

          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.35,
          ),

          itemBuilder: (context, index) {

            final category = categories[index];

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.productsByCategory,
                  arguments: category.name,
                );
              },
              child: CategoryCard(
                category: category,
                accentColor: accentColor,
                surfaceColor: surfaceColor,
                borderColor: borderColor,
                textPrimaryColor: textPrimaryColor,
                textSecondaryColor: textSecondaryColor,
              ),
            );
          },
        ),

      ],
    );
  }
}

