import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class CartTotalSection extends StatelessWidget {
  final double total;

  const CartTotalSection({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tr.total,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            "\$${total.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 22,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

