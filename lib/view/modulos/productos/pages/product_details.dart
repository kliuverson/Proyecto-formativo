import 'package:flutter/material.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/bloc/cart_bloc.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/bloc/cart_event.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;

  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final isEn = locale == 'en';

    final nombre = isEn && product.nombreEn.isNotEmpty
        ? product.nombreEn
        : product.nombre;

    final descripcion = isEn && product.descripcionEn.isNotEmpty
        ? product.descripcionEn
        : product.descripcion.isNotEmpty
            ? product.descripcion
            : tr.noDescription;

    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
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
              nombre,
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
              descripcion,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            /// 🔥 BOTÓN
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  final cartItem = CartItem(
                    id: product.sku,           // ← era product.id
                    name: product.nombre,
                    nameEn: product.nombreEn,  // ← AÑADIDO
                    price: product.precio,
                    quantity: 1,
                  );

                  context.read<CartBloc>().add(AddToCart(cartItem));

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(tr.productAddedToCart),
                    ),
                  );
                },
                child: Text(tr.addToCart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}