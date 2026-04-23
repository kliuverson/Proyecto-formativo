// product_form.dart
import 'package:flutter/material.dart';
import 'product_fields.dart';
import 'admin_actions.dart';

class ProductForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;

  const ProductForm({super.key, required this.onSubmit});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();

  final skuController = TextEditingController();
  final nombreController = TextEditingController();
  final precioController = TextEditingController();
  final stockController = TextEditingController();
  final imageController = TextEditingController();
  final descripcionController = TextEditingController();

  void submit() {
    if (!_formKey.currentState!.validate()) return;

    widget.onSubmit({
      "sku": skuController.text,
      "nombre": nombreController.text,
      "precio": double.parse(precioController.text),
      "stock": int.parse(stockController.text),
      "image": imageController.text,
      "descripcion": descripcionController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: ProductFields(
              skuController: skuController,
              nombreController: nombreController,
              precioController: precioController,
              stockController: stockController,
              imageController: imageController,
              descripcionController: descripcionController,
            ),
          ),

          AdminActions(
            onSave: submit,
          ),
        ],
      ),
    );
  }
}