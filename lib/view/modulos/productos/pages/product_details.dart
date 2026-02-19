import 'package:ferremateriales/view/modulos/carrito/pages/model/cart_model.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/service/cart_service.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              product.icon,
              size: 100,
            ),
            const SizedBox(height: 20),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "\$${product.price}",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 30),

            /// 🔥 BOTÓN AGREGAR AL CARRITO
            ElevatedButton(
              onPressed: () {
                final cartItem = CartItem(
                  id: product.id,
                  name: product.name,
                  price: product.price,
                );

                CartService.addProduct(cartItem);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Producto agregado al carrito"),
                  ),
                );
              },
              child: const Text("Agregar al carrito"),
            ),
          ],
        ),
      ),
    );
  }
}
