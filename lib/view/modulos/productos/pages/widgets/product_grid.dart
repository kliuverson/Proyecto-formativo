import 'package:flutter/material.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:ferremateriales/view/home/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> productos;
  final Function(ProductModel) onTap;

  const ProductGrid({
    super.key,
    required this.productos,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: productos.length,
      itemBuilder: (context, index) {
        final product = productos[index];
        return ProductCard(
          product: product,
          onTap: () => onTap(product),
        );
      },
    );
  }
}