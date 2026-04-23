// product_fields.dart
import 'package:flutter/material.dart';

class ProductFields extends StatelessWidget {
  final TextEditingController skuController;
  final TextEditingController nombreController;
  final TextEditingController precioController;
  final TextEditingController stockController;
  final TextEditingController imageController;
  final TextEditingController descripcionController;

  const ProductFields({
    super.key,
    required this.skuController,
    required this.nombreController,
    required this.precioController,
    required this.stockController,
    required this.imageController,
    required this.descripcionController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextFormField(
          controller: skuController,
          decoration: const InputDecoration(labelText: "SKU"),
          validator: (v) => v!.isEmpty ? "Campo obligatorio" : null,
        ),
        TextFormField(
          controller: nombreController,
          decoration: const InputDecoration(labelText: "Nombre"),
          validator: (v) => v!.isEmpty ? "Campo obligatorio" : null,
        ),
        TextFormField(
          controller: precioController,
          decoration: const InputDecoration(labelText: "Precio"),
          keyboardType: TextInputType.number,
          validator: (v) {
            if (v!.isEmpty) return "Campo obligatorio";
            if (double.tryParse(v) == null) return "Número inválido";
            return null;
          },
        ),
        TextFormField(
          controller: stockController,
          decoration: const InputDecoration(labelText: "Stock"),
          keyboardType: TextInputType.number,
          validator: (v) {
            if (v!.isEmpty) return "Campo obligatorio";
            if (int.tryParse(v) == null) return "Número inválido";
            return null;
          },
        ),
        TextFormField(
          controller: imageController,
          decoration: const InputDecoration(labelText: "Imagen"),
          validator: (v) => v!.isEmpty ? "Campo obligatorio" : null,
        ),
        TextFormField(
          controller: descripcionController,
          decoration: const InputDecoration(labelText: "Descripción"),
        ),
      ],
    );
  }
}