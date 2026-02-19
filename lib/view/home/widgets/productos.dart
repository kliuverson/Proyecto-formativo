
import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:ferremateriales/view/modulos/productos/pages/product_details.dart';
import 'package:flutter/material.dart';


class Productos extends StatelessWidget {
  const Productos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> productos = [
      {
        'nombre': 'Martillo',
        'precio': '\$25.0',
        'imagen': Icons.build,
      },
      {
        'nombre': 'Taladro',
        'precio': '\$120.0',
        'imagen': Icons.handyman,
      },
      {
        'nombre': 'Destornillador',
        'precio': '\$15.0',
        'imagen': Icons.construction,
      },
      {
        'nombre': 'Llave Inglesa',
        'precio': '\$30.0',
        'imagen': Icons.build_circle,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
              childAspectRatio: 0.75,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: productos.length,
            itemBuilder: (context, index) {
              final productoMap = productos[index];

              return GestureDetector(
                onTap: () {
                  // 🔥 Convertimos Map en Product
                  final product = Product(
                    id: index.toString(),
                    name: productoMap['nombre'],
                    price: double.parse(
                      productoMap['precio'].replaceAll('\$', ''),
                    ),
                    icon: productoMap['imagen'],
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetail(product: product),
                    ),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.grey[300],
                          child: Center(
                            child: Icon(
                              productoMap['imagen'],
                              size: 50,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productoMap['nombre'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              productoMap['precio'],
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
