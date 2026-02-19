import 'package:ferremateriales/view/modulos/carrito/pages/service/cart_service.dart';
import 'package:flutter/material.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrito"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<List>(
        valueListenable: CartService.itemsNotifier,
        builder: (context, items, _) {
          if (items.isEmpty) {
            return const Center(
              child: Text(
                "El carrito está vacío",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: ListTile(
                        title: Text(item.name),
                        subtitle: Text("Cantidad: ${item.quantity}"),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$${item.subtotal.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                CartService.removeProductById(item.id);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const Divider(),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ValueListenableBuilder<List>(
                  valueListenable: CartService.itemsNotifier,
                  builder: (context, items2, _) {
                    final total = items2.fold<double>(0.0,
                        (sum, item) => sum + (item.subtotal as double));
                    return Text(
                      "Total: \$${total.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
