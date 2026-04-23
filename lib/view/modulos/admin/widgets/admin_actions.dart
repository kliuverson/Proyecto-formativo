import 'package:flutter/material.dart';

class AdminActions extends StatelessWidget {
  const AdminActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          // abrir formulario
        },
        child: const Text('Agregar producto'),
      ),
    );
  }
}