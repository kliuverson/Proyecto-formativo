import 'package:ferremateriales/utils/helpers/helpers_functions.dart';
import 'package:ferremateriales/view/modulos/profile/models/profile_user_model.dart';
import 'package:ferremateriales/view/modulos/profile/widgets/edit_profile_form.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final UserProfileModel user;

  const EditProfilePage({super.key, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final dark = THelpersFunctions.esModoOscuro(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Perfil"),
      ),
      body: Container(
        color: dark ? Colors.black : Colors.grey.shade50,
        child: SafeArea(
          child: EditProfileForm(user: widget.user),
        ),
      ),
    );
  }
}