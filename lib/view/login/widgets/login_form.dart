import 'package:ferremateriales/utils/constants/size.dart';
import 'package:ferremateriales/utils/constants/text_string.dart';
import 'package:ferremateriales/view/login/cubit/cubit/login_cubit.dart';
import 'package:ferremateriales/view/login/cubit/mostrar_password_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final correoController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("${state.error}")));
        }

        if (state.token != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Login exitoso!")));
          Navigator.pushReplacementNamed(context, "/home");
        }
      },
      child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSize.spaceBtwSections),
          child: Column(
            children: [
              //Correo
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.mail),
                  labelText: TText.email,
                  hintText: TText.emailExample,
                ),
                controller: correoController,
              ),
              const SizedBox(height: TSize.spaceBtwInputFields),

              // Contraseña
              BlocBuilder<MostrarPasswordCubit, MostrarPasswordState>(
                builder: (context, state) {
                  return TextFormField(
                    obscureText: !state.isVisible,
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.lock),
                      suffixIcon: IconButton(
                        icon:
                            state.isVisible
                                ? Icon(CupertinoIcons.eye)
                                : Icon(CupertinoIcons.eye_slash),
                        onPressed: () {
                          context.read<MostrarPasswordCubit>().alternarContra();
                        },
                      ),
                      labelText: TText.password,
                    ),
                  );
                },
              ),
              const SizedBox(height: TSize.spaceBtwInputFields / 2),

              // Recordame y Olvidar Contraseña
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Recuerdame
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text(TText.rememberMe),
                    ],
                  ),

                  // Olvidar Contraseña
                  TextButton(
                    onPressed: () {},
                    child: Text(TText.forgetPassword),
                  ),
                ],
              ),
              const SizedBox(height: TSize.spaceBtwSections),

              // Iniciar Sesion Boton
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          state.isLoading
                              ? null
                              : () {
                                context.read<LoginCubit>().login(
                                  correoController.text,
                                  passwordController.text,
                                );
                              },
                      child:
                          state.isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(TText.signIn),
                    ),
                  );
                },
              ),
              const SizedBox(height: TSize.md),

              // Crear Cuenta Boton
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  child: Text(TText.createAccount),
                ),
              ),

              const SizedBox(height: TSize.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
