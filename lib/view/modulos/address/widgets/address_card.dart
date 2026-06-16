import 'package:ferremateriales/view/modulos/address/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onPrincipal;

  const AddressCard({
    super.key,
    required this.address,
    required this.onDelete,
    required this.onEdit,
    required this.onPrincipal,
  });

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (address.principal)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tr.principal,
                  style: const TextStyle(color: Colors.white),
                ),
              ),

            const SizedBox(height: 10),

            Text(
              address.nombreDestinatario,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 5),
            Text(address.telefono, style: const TextStyle(color: Colors.black87)),

            const SizedBox(height: 5),
            Text(address.direccion, style: const TextStyle(color: Colors.black87)),

            const SizedBox(height: 5),
            Text(
              "${address.ciudad}, ${address.departamento}",
              style: const TextStyle(color: Colors.black87),
            ),

            if (address.referencia.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  tr.addressReference(address.referencia),
                  style: const TextStyle(color: Colors.black54),
                ),
              ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onPrincipal,
                  icon: const Icon(Icons.star, color: Colors.orange),
                ),
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit, color: Colors.blue),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

