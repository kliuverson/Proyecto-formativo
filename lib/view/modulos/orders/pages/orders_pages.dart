import 'package:flutter/material.dart';
import '../widgets/orders_card.dart';

class OrdersPage extends StatelessWidget {
  final List orders = [
    {
      "id": 2401,
      "fecha": "24 mar 2026",
      "total": 12.80,
      "estado": "entregado",
      "productos": ["Martillo", "Clavos"]
    },
    {
      "id": 2400,
      "fecha": "22 mar 2026",
      "total": 21.70,
      "estado": "camino",
      "productos": ["Taladro", "Brocas"]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 👈 fondo oscuro
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Mis pedidos",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔢 Texto superior (ej: "7 pedidos realizados")
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "${orders.length} pedidos realizados",
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
            ),
          ),

          // 📦 Lista
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrdersCard(order: orders[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}