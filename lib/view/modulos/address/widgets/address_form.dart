import 'package:flutter/material.dart';

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
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nombreController,
            decoration: const InputDecoration(
              labelText: "Nombre destinatario",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Campo requerido";
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          TextFormField(
            controller: telefonoController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: "Teléfono",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Campo requerido";
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          TextFormField(
            controller: departamentoController,
            decoration: const InputDecoration(
              labelText: "Departamento",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Campo requerido";
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          TextFormField(
            controller: ciudadController,
            decoration: const InputDecoration(
              labelText: "Ciudad",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Campo requerido";
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          TextFormField(
            controller: direccionController,
            decoration: const InputDecoration(
              labelText: "Dirección",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Campo requerido";
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          TextFormField(
            controller: referenciaController,
            decoration: const InputDecoration(
              labelText: "Referencia",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 15),

          TextFormField(
            controller: codigoPostalController,
            decoration: const InputDecoration(
              labelText: "Código postal",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 15),

          SwitchListTile(
            value: principal,
            title: const Text("Dirección principal"),
            onChanged: onPrincipalChanged,
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: onSubmit,
              child: const Text("Guardar dirección"),
            ),
          ),
        ],
      ),
    );
  }
}