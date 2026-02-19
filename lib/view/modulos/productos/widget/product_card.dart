import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Icon(product.icon, size: 60),
            ),
            Text(product.name),
            Text("\$${product.price}"),
          ],
        ),
      ),
    );
  }
}
