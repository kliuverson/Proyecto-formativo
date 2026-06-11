import 'package:ferremateriales/utils/helpers/helpers_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/service/auth_service.dart';
import 'package:ferremateriales/view/login/cubit/cubit/reset_password_cubit.dart';
import 'package:ferremateriales/view/login/cubit/mostrar_password_cubit.dart'; // Importamos tu Cubit de visibilidad

class ResetPasswordPage extends StatefulWidget {
  final String token;

  const ResetPasswordPage({super.key, required this.token});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelpersFunctions.esModoOscuro(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Restablecer Contraseña')),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ResetPasswordCubit(authService: AuthService()),
          ),
          BlocProvider(create: (context) => MostrarPasswordCubit()),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Crea una nueva contraseña',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Por favor, escribe y confirma tu nueva contraseña para asegurar el acceso a tu cuenta.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Escuchamos el estado de MostrarPasswordCubit para renderizar los campos
                BlocBuilder<MostrarPasswordCubit, MostrarPasswordState>(
                  builder: (context, passwordState) {
                    // Si isVisible es true, obscureText debe ser false
                    final obscureText = !passwordState.isVisible;

                    return Column(
                      children: [
                        // Campo: Nueva Contraseña
                        TextFormField(
                          controller: _passwordController,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            labelText: 'Nueva Contraseña',
                            prefixIcon: const Icon(CupertinoIcons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordState.isVisible
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash,
                              ),
                              onPressed: () {
                                // Disparamos la acción de tu Cubit personalizado
                                context
                                    .read<MostrarPasswordCubit>()
                                    .alternarContra();
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor ingresa una contraseña';
                            }
                            if (value.length < 6) {
                              return 'La contraseña debe tener al menos 6 caracteres';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        // Campo: Confirmar Contraseña
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: obscureText,
                          decoration: const InputDecoration(
                            labelText: 'Confirmar Contraseña',
                            prefixIcon: Icon(CupertinoIcons.lock_shield),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor confirma tu contraseña';
                            }
                            if (value != _passwordController.text) {
                              return 'Las contraseñas no coinciden';
                            }
                            return null;
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 32),

                // BlocConsumer para procesar la petición HTTP del Reset
                BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                  listener: (context, state) {
                    if (state is ResetPasswordSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.message,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    } else if (state is ResetPasswordError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.message,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state is ResetPasswordLoading;

                    return ElevatedButton(
                      onPressed:
                          isLoading
                              ? null
                              : () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<ResetPasswordCubit>()
                                      .resetPassword(
                                        widget.token,
                                        _passwordController.text.trim(),
                                      );
                                }
                              },
                      child:
                          isLoading
                              ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                              : const Text('Guardar Nueva Contraseña'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
