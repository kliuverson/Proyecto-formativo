import 'package:flutter/material.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/model/cart_model.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/service/cart_service.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;

  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.nombre),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔥 IMAGEN
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                product.image.isNotEmpty
                    ? product.image
                    : "https://images.unsplash.com/photo-1581092334651-ddf26d9a09d0",
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            /// 🔹 NOMBRE
            Text(
              product.nombre,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// 🔹 PRECIO
            Text(
              "\$${product.precio.toStringAsFixed(0)}",
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            /// 🔹 DESCRIPCIÓN
            Text(
              product.descripcion.isNotEmpty
                  ? product.descripcion
                  : "Sin descripción disponible",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            /// 🔥 BOTÓN
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  final cartItem = CartItem(
                    id: product.sku,
                    name: product.nombre,
                    price: product.precio,
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
            ),
          ],
        ),
      ),
    );
  }
}