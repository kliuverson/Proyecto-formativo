import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  final Map order;

  const OrderDetailPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle del pedido"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fecha: ${order["fecha"]}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),

            Text(
              "Productos:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            ...order["productos"].map<Widget>((producto) {
              return Text("- $producto");
            }).toList(),

            SizedBox(height: 10),

            Text(
              "Total: \$${order["total"]}",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}