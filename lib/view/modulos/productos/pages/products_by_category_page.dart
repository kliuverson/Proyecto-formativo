import 'package:ferremateriales/view/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';

import 'product_details.dart';

class ProductsByCategoryPage extends StatelessWidget {

  final String categoryName;
  final List<Product> products;

  const ProductsByCategoryPage({
    super.key,
    required this.categoryName,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),

      body: products.isEmpty
          ? const Center(
              child: Text("No hay productos en esta categoría"),
            )
          : Padding(
              padding: const EdgeInsets.all(12),

              child: GridView.builder(
                itemCount: products.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),

                itemBuilder: (context, index) {

                  final product = products[index];

                  return ProductCard(
                    product: product,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetail(product: product),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
    );
  }
}
