import 'package:ferremateriales/utils/helpers/helpers_functions.dart';
import 'package:ferremateriales/view/login/cubit/cubit/forgot_password_cubit.dart';
import 'package:flutter/cupertino.dart'; // Importante añadir los iconos de Cupertino
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _correoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _correoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelpersFunctions.esModoOscuro(context);
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error!)));
        }

        if (state.successMessage != null) {
          _correoController.clear();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.successMessage!)));
          Navigator.pop(context);
        }
      },

      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            // Cambiado por el clásico estilo chevron de iOS
            leading: IconButton(
              icon: const Icon(CupertinoIcons.chevron_back, size: 22),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(
                          alpha: isDarkMode ? 0.15 : 0.1,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        CupertinoIcons.lock_shield,
                        size: 58,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  Text(
                    "¿Olvidaste tu contraseña?",
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Ingresa el correo electrónico asociado a tu cuenta de Ferremateriales DGC y te enviaremos las instrucciones para restablecer tu contraseña.",
                    style: textTheme.bodyMedium?.copyWith(
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 36),

                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _correoController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "El correo es obligatorio";
                        }

                        final emailRegex = RegExp(
                          r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$',
                        );

                        if (!emailRegex.hasMatch(value.trim())) {
                          return "Por favor ingresa un correo válido";
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Correo electrónico",
                        hintText: "ejemplo@correo.com",
                        prefixIcon: Icon(CupertinoIcons.mail, size: 22),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          state.isLoading
                              ? null
                              : () {

                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }

                                context
                                    .read<ForgotPasswordCubit>()
                                    .forgotPassword(
                                      _correoController.text.trim(),
                                    );
                              },
                      child:
                          state.isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : const Text("Enviar enlace de recuperación"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
