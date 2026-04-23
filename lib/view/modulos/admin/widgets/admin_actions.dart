// admin_actions.dart
import 'package:flutter/material.dart';

class AdminActions extends StatelessWidget {
  final VoidCallback onSave;

  const AdminActions({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onSave,
          child: const Text("Guardar Producto"),
        ),
      ),
    );
  }
}