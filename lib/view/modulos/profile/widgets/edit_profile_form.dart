import 'package:ferremateriales/view/modulos/profile/cubit/profile_cubit.dart';
import 'package:ferremateriales/view/modulos/profile/models/profile_user_model.dart';
import 'package:ferremateriales/view/modulos/profile/widgets/profile_header_card.dart';
import 'package:ferremateriales/view/modulos/profile/widgets/profile_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class EditProfileForm extends StatefulWidget {
  final UserProfileModel user;

  const EditProfileForm({super.key, required this.user});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final formKey = GlobalKey<FormState>();

  late final TextEditingController nombreController;
  late final TextEditingController apellidoController;
  late final TextEditingController usernameController;
  late final TextEditingController correoController;
  late final TextEditingController telefonoController;

  String? usernameError;
  String? correoError;
  String? telefonoError;

  @override
  void initState() {
    super.initState();

    final user = widget.user;

    nombreController = TextEditingController(text: user.nombre);
    apellidoController = TextEditingController(text: user.apellido);
    usernameController = TextEditingController(text: user.username);
    correoController = TextEditingController(text: user.correo);
    telefonoController = TextEditingController(text: user.numeroTelefono);

    _listenClearError(usernameController, () => usernameError = null);
    _listenClearError(correoController, () => correoError = null);
    _listenClearError(telefonoController, () => telefonoError = null);
  }

  void _listenClearError(TextEditingController controller, VoidCallback clear) {
    controller.addListener(() {
      if (mounted) {
        setState(clear);
      }
    });
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

  bool get hasChanges {
    final user = widget.user;

    return nombreController.text.trim() != user.nombre ||
        apellidoController.text.trim() != user.apellido ||
        usernameController.text.trim() != user.username ||
        correoController.text.trim() != user.correo ||
        telefonoController.text.trim() != user.numeroTelefono;
  }

  void submitForm() {
    final tr = AppLocalizations.of(context)!;
    FocusScope.of(context).unfocus();

    if (!formKey.currentState!.validate()) return;

    if (!hasChanges) {
      _showMessage(tr.noChanges);
      return;
    }

    _clearErrors();

    context.read<ProfileCubit>().updateUserProfile(
      nombre: nombreController.text.trim(),
      apellido: apellidoController.text.trim(),
      username: usernameController.text.trim(),
      correo: correoController.text.trim(),
      numeroTelefono: telefonoController.text.trim(),
    );
  }

  void _clearErrors() {
    setState(() {
      usernameError = null;
      correoError = null;
      telefonoError = null;
    });
  }

  bool _mapFieldErrors(String message) {
    final msg = message.toLowerCase();

    String? userError;
    String? mailError;
    String? phoneError;

    if (msg.contains("usuario")) {
      userError = message;
    } else if (msg.contains("correo")) {
      mailError = message;
    } else if (msg.contains("numero telefonico") || msg.contains("numero teléfonico")) {
      phoneError = message;
    }

    final hasError =
        userError != null || mailError != null || phoneError != null;

    setState(() {
      usernameError = userError;
      correoError = mailError;
      telefonoError = phoneError;
    });

    return hasError;
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileUpdated) {
          Navigator.pop(context, true);
        }

        if (state is ProfileFailure) {
          final hasFieldError = _mapFieldErrors(state.message);

          if (!hasFieldError) {
            _showMessage(state.message);
          }
        }
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final isLoading = state is ProfileUpdating;

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
                    label: tr.firstName,
                    icon: CupertinoIcons.person,
                  ),

                  const SizedBox(height: 16),

                  ProfileTextField(
                    controller: apellidoController,
                    label: tr.lastName,
                    icon: CupertinoIcons.person_crop_circle,
                  ),

                  const SizedBox(height: 16),

                  ProfileTextField(
                    controller: usernameController,
                    label: tr.username,
                    icon: CupertinoIcons.at,
                    errorText: usernameError,
                  ),

                  const SizedBox(height: 16),

                  ProfileTextField(
                    controller: correoController,
                    label: tr.correo,
                    icon: CupertinoIcons.mail,
                    keyboardType: TextInputType.emailAddress,
                    errorText: correoError,
                  ),

                  const SizedBox(height: 16),

                  ProfileTextField(
                    controller: telefonoController,
                    label: tr.telefono,
                    icon: CupertinoIcons.phone,
                    keyboardType: TextInputType.phone,
                    errorText: telefonoError,
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : submitForm,
                      child:
                          isLoading
                              ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                              : Text(tr.saveChanges),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

