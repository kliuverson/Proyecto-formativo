import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class AddressForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController nombreController;
  final TextEditingController telefonoController;
  final TextEditingController departamentoController;
  final TextEditingController ciudadController;
  final TextEditingController direccionController;
  final TextEditingController referenciaController;
  final TextEditingController codigoPostalController;

  final bool principal;

  final ValueChanged<bool> onPrincipalChanged;

  final VoidCallback onSubmit;

  const AddressForm({
    super.key,
    required this.formKey,
    required this.nombreController,
    required this.telefonoController,
    required this.departamentoController,
    required this.ciudadController,
    required this.direccionController,
    required this.referenciaController,
    required this.codigoPostalController,
    required this.principal,
    required this.onPrincipalChanged,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nombreController,
            decoration: InputDecoration(
              labelText: tr.recipientName,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return tr.requiredField;
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          TextFormField(
            controller: telefonoController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: tr.phone,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return tr.requiredField;
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          TextFormField(
            controller: departamentoController,
            decoration: InputDecoration(
              labelText: tr.department,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return tr.requiredField;
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          TextFormField(
            controller: ciudadController,
            decoration: InputDecoration(
              labelText: tr.city,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return tr.requiredField;
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          TextFormField(
            controller: direccionController,
            decoration: InputDecoration(
              labelText: tr.address,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return tr.requiredField;
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          TextFormField(
            controller: referenciaController,
            decoration: InputDecoration(
              labelText: tr.reference,
              border: const OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 15),

          TextFormField(
            controller: codigoPostalController,
            decoration: InputDecoration(
              labelText: tr.postalCode,
              border: const OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 15),

          SwitchListTile(
            value: principal,
            title: Text(tr.mainAddress),
            onChanged: onPrincipalChanged,
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: onSubmit,
              child: Text(tr.saveAddress),
            ),
          ),
        ],
      ),
    );
  }
}

