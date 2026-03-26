import 'package:flutter/material.dart';
import '../pages/orders_detail_page.dart';

class OrdersCard extends StatelessWidget {
  final Map order;

  const OrdersCard({required this.order});

  @override
  Widget build(BuildContext context) {
    final bool entregado = order["estado"] == "entregado";

    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OrderDetailPage(order: order),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Color(0xFF1E1E1E), // 👈 fondo oscuro
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            // 📦 Icono
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.inventory_2, color: Colors.orange),
            ),

            SizedBox(width: 12),

            // 📄 Info izquierda
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ORD-${order["id"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    order["fecha"],
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "${order["productos"].length} productos",
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ],
              ),
            ),

            // 💰 Precio + estado + flecha
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Estado
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: entregado
                        ? Colors.green.withOpacity(0.2)
                        : Colors.orange.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    entregado ? "Entregado" : "En camino",
                    style: TextStyle(
                      color: entregado ? Colors.green : Colors.orange,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SizedBox(height: 8),

                // Precio
                Text(
                  "\$${order["total"]}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            SizedBox(width: 8),

            // 👉 Flecha
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}