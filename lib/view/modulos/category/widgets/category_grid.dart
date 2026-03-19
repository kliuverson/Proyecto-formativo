import 'package:flutter/material.dart';
import '../model/category_data.dart';
import 'category_card.dart';
import '../../productos/pages/products_by_category_page.dart';
import '../../productos/service/product_service.dart';

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

        return GestureDetector(
          onTap: () {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsByCategoryPage(
                  categoryName: category.name,
                  products: ProductService.getProductsByCategory(category.name),
                ),
              ),
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
    );
  }
}