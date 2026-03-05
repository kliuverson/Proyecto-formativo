// lib/view/modulos/carrito/pages/cart_page.dart
import 'package:ferremateriales/view/modulos/carrito/pages/service/cart_service.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/model/cart_model.dart'; // Asegúrate de que esta ruta sea correcta
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
        backgroundColor: Colors.white, // Para unificar el estilo con tu HomeAppBar
        foregroundColor: Colors.black, // Para unificar el estilo con tu HomeAppBar
        elevation: 0, // Sin sombra, como en tu HomeAppBar
      ),
      // >>>>> CORRECCIÓN IMPORTANTE AQUÍ: Especificar el tipo List<CartItem> <<<<<
      body: ValueListenableBuilder<List<CartItem>>(
        valueListenable: CartService.itemsNotifier,
        builder: (context, items, _) {
          // >>> DEBUGGING: Verifica el contenido exacto de los ítems <<<
          debugPrint('CartPage: itemsNotifier actualizado. Total ítems: ${items.length}');
          if (items.isNotEmpty) {
            debugPrint('Primer ítem en CartPage: ID=${items.first.id}, Nombre=${items.first.name}, Qty=${items.first.quantity}, Subtotal=${items.first.subtotal}');
          }
          // >>> FIN DEBUGGING <<<

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
                    // >>> DEBUGGING: Verifica cada ítem mientras se construye <<<
                    debugPrint('Construyendo ListTile para: ${item.name} (Cantidad: ${item.quantity})');
                    // >>> FIN DEBUGGING <<<

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: ListTile(
                        // leading: Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover), // Descomenta si CartItem tiene imageUrl
                        title: Text(item.name),
                        subtitle: Text("Cantidad: ${item.quantity}"),
                        trailing: Row( // Usamos un Row para alinear el precio y el botón de eliminar
                          mainAxisSize: MainAxisSize.min, // Ocupa el espacio mínimo necesario
                          children: [
                            Text(
                              "\$${item.subtotal.toStringAsFixed(2)}", // Usa el getter subtotal de CartItem
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
                // >>> NO NECESITAS OTRO ValueListenableBuilder AQUÍ si el CartService.total ya está actualizado <<<
                // Simplemente accedes a CartService.total
                child: Text( // Usamos CartService.total que ya es un getter actualizado
                  "Total: \$${CartService.total.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding( // Agregamos el botón de Proceder al Pago
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para proceder al pago
                      debugPrint('Proceder al pago con total: \$${CartService.total.toStringAsFixed(2)}');
                      // CartService.clearCart(); // Opcional: limpiar carrito después de pagar
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.orange, // Un color de acento
                      foregroundColor: Colors.white, // Color del texto del botón
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Bordes redondeados
                      ),
                    ),
                    child: const Text(
                      'Proceder al Pago',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16), // Espacio al final de la pantalla
            ],
          );
        },
      ),
    );
  }
}