import 'package:flutter/material.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> productos;
  final Function(ProductModel) onTap;

  const ProductList({
    super.key,
    required this.productos,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final isEn = locale == 'en';

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: productos.length,
      itemBuilder: (context, index) {
        final product = productos[index];

        final nombre = isEn && product.nombreEn.isNotEmpty
            ? product.nombreEn
            : product.nombre;

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: product.image.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.image,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.image,
                          size: 30,
                          color: Colors.grey[600],
                        ),
                      ),
                    )
                  : Icon(Icons.image, size: 30, color: Colors.grey[600]),
            ),
            title: Text(
              nombre,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            subtitle: Text(
              '\$${product.precio.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => onTap(product),
          ),
        );
      },
    );
  }
}