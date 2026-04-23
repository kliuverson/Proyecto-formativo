import 'package:ferremateriales/view/modulos/admin/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List productos;

  const ProductList({super.key, required this.productos});

  @override
  Widget build(BuildContext context) {
    if (productos.isEmpty) {
      return const Center(child: Text('No hay productos'));
    }

    return ListView.builder(
      itemCount: productos.length,
      itemBuilder: (context, index) {
        final producto = productos[index];

        return ProductItem(
          nombre: producto['nombre'],
        );
      },
    );
  }
}