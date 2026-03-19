import 'package:ferremateriales/view/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:ferremateriales/view/modulos/productos/pages/product_details.dart';

class Productos extends StatelessWidget {
  final List<ProductModel> products;

  const Productos({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final display =
        products.length > 4 ? products.sublist(0, 4) : products;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Productos Destacados',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.90,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: display.length,
          itemBuilder: (context, index) {
            final product = display[index];

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
      ],
    );
  }
}