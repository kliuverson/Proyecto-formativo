import 'package:ferremateriales/view/modulos/profile/models/profile_user_model.dart';
import 'package:ferremateriales/view/modulos/profile/widgets/profile_header_card.dart';
import 'package:ferremateriales/view/modulos/profile/widgets/profile_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileForm extends StatefulWidget {
  final UserProfileModel user;

  const EditProfileForm({super.key, required this.user});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController nombreController;
  late TextEditingController apellidoController;
  late TextEditingController usernameController;
  late TextEditingController correoController;
  late TextEditingController telefonoController;

  @override
  void initState() {
    super.initState();

    nombreController = TextEditingController(text: widget.user.nombre);
    apellidoController = TextEditingController(text: widget.user.apellido);
    usernameController = TextEditingController(text: widget.user.username);
    correoController = TextEditingController(text: widget.user.correo);
    telefonoController = TextEditingController(
      text: widget.user.numeroTelefono,
    );
  }

  @override
  void dispose() {
    nombreController.dispose();
    apellidoController.dispose();
    usernameController.dispose();
    correoController.dispose();
    telefonoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 10),

            ProfileHeaderCard(user: widget.user),

            const SizedBox(height: 30),

            ProfileTextField(
              controller: nombreController,
              label: "Nombre",
              icon: CupertinoIcons.person,
            ),

            const SizedBox(height: 16),

            ProfileTextField(
              controller: apellidoController,
              label: "Apellido",
              icon: CupertinoIcons.person_crop_circle,
            ),

            const SizedBox(height: 16),

            ProfileTextField(
              controller: usernameController,
              label: "Usuario",
              icon: CupertinoIcons.at,
            ),

            const SizedBox(height: 16),

            ProfileTextField(
              controller: correoController,
              label: "Correo",
              icon: CupertinoIcons.mail,
            ),

            const SizedBox(height: 16),

            ProfileTextField(
              controller: telefonoController,
              label: "Teléfono",
              icon: CupertinoIcons.phone,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    /// aquí conectaremos cubit luego
                  }
                },
                child: const Text("Guardar Cambios"),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}