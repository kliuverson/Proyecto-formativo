import 'package:flutter/material.dart';

class EmptyAddress extends StatelessWidget {
  const EmptyAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_off,
            size: 90,
            color: Colors.grey,
          ),
          SizedBox(height: 15),
          Text(
            "No tienes direcciones guardadas",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}