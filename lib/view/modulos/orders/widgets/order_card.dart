import 'package:ferremateriales/view/modulos/orders/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  Color getStatusColor() {
    switch (order.status) {
      case 'paid':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String getStatusLabel(AppLocalizations tr) {
    switch (order.status) {
      case 'paid':
        return tr.statusPaid;
      case 'pending':
        return tr.statusPending;
      case 'failed':
        return tr.statusFailed;
      default:
        return order.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr.orderNumber(order.id.substring(0, 6)),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusColor(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    getStatusLabel(tr),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              tr.productsCount(order.items.length),
              style: const TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 5),
            Text(
              tr.orderTotal(order.total.toString()),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              order.createdAt.toString(),
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

