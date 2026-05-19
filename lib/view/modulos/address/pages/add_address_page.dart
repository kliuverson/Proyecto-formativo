import 'package:ferremateriales/view/modulos/address/cubit/address_cubit.dart';
import 'package:ferremateriales/view/modulos/address/model/address_model.dart';
import 'package:ferremateriales/view/modulos/address/widgets/address_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAddressPage extends StatefulWidget {
  final AddressModel? address;

  const AddAddressPage({super.key, this.address});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController nombreController;
  late TextEditingController telefonoController;
  late TextEditingController departamentoController;
  late TextEditingController ciudadController;
  late TextEditingController direccionController;
  late TextEditingController referenciaController;
  late TextEditingController codigoPostalController;

  bool principal = false;

  @override
  void initState() {
    super.initState();

    final address = widget.address;

    nombreController = TextEditingController(
      text: address?.nombreDestinatario ?? "",
    );

    telefonoController = TextEditingController(
      text: address?.telefono ?? "",
    );

    departamentoController = TextEditingController(
      text: address?.departamento ?? "",
    );

    ciudadController = TextEditingController(
      text: address?.ciudad ?? "",
    );

    direccionController = TextEditingController(
      text: address?.direccion ?? "",
    );

    referenciaController = TextEditingController(
      text: address?.referencia ?? "",
    );

    codigoPostalController = TextEditingController(
      text: address?.codigoPostal ?? "",
    );

    principal = address?.principal ?? false;
  }

  @override
  void dispose() {
    nombreController.dispose();
    telefonoController.dispose();
    departamentoController.dispose();
    ciudadController.dispose();
    direccionController.dispose();
    referenciaController.dispose();
    codigoPostalController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddressCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.address == null
              ? "Agregar dirección"
              : "Editar dirección",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: AddressForm(
          formKey: formKey,

          nombreController: nombreController,

          telefonoController: telefonoController,

          departamentoController: departamentoController,

          ciudadController: ciudadController,

          direccionController: direccionController,

          referenciaController: referenciaController,

          codigoPostalController: codigoPostalController,

          principal: principal,

          onPrincipalChanged: (value) {
            setState(() {
              principal = value;
            });
          },

          onSubmit: () async {

            if (!formKey.currentState!.validate()) {
              return;
            }

            final address = AddressModel(
              id: widget.address?.id ??
                  DateTime.now().millisecondsSinceEpoch.toString(),

              nombreDestinatario: nombreController.text,

              telefono: telefonoController.text,

              departamento: departamentoController.text,

              ciudad: ciudadController.text,

              direccion: direccionController.text,

              referencia: referenciaController.text,

              codigoPostal: codigoPostalController.text,

              principal: principal,
            );

            if (widget.address == null) {

              await cubit.createAddress(address);

            } else {

              await cubit.updateAddress(
                widget.address!.id,
                address,
              );
            }

            final state = cubit.state;

            if (state.error != null) {

              if (mounted) {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error!),
                  ),
                );
              }

              return;
            }

            if (mounted) {

              /// DEVOLVER TRUE
              Navigator.pop(context, true);
            }
          },
        ),
      ),
    );
  }
}