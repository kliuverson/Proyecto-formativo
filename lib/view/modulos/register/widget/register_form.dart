import 'package:ferremateriales/utils/constants/size.dart';
import 'package:ferremateriales/utils/constants/text_string.dart';
import 'package:ferremateriales/view/login/cubit/mostrar_password_cubit.dart';
import 'package:ferremateriales/view/modulos/register/cubit/register_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TFormRegister extends StatelessWidget {
  const TFormRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController apellidoController = TextEditingController();
    final TextEditingController nombreUsuarioController =
        TextEditingController();
    final TextEditingController correoController = TextEditingController();
    final TextEditingController telefonoController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }

        if (state.successMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.successMessage!)));
          Navigator.pushReplacementNamed(context, "/login");
        }
      },
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Form(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      //Nombre
                      child: TextFormField(
                        controller: nombreController,
                        expands: false,
                        decoration: InputDecoration(
                          labelText: TText.firstName,
                          prefixIcon: Icon(CupertinoIcons.person),
                          errorText: state.fieldErrors?["nombre"],
                        ),
                      ),
                    ),
                    const SizedBox(width: TSize.spaceBtwInputFields),
                    //Apellido
                    Expanded(
                      child: TextFormField(
                        controller: apellidoController,
                        expands: false,
                        decoration: InputDecoration(
                          labelText: TText.lastName,
                          prefixIcon: Icon(CupertinoIcons.person),
                          errorText: state.fieldErrors?["apellido"],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSize.spaceBtwInputFields),
                // Nombre de Usuario
                TextFormField(
                  controller: nombreUsuarioController,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TText.username,
                    prefixIcon: Icon(CupertinoIcons.person_crop_circle),
                    errorText: state.fieldErrors?["username"],
                  ),
                ),
                const SizedBox(height: TSize.spaceBtwInputFields),
                // Correo Electronico
                TextFormField(
                  controller: correoController,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TText.email,
                    prefixIcon: Icon(CupertinoIcons.mail),
                    errorText: state.fieldErrors?["correo"],
                  ),
                ),
                const SizedBox(height: TSize.spaceBtwInputFields),
                // Numero de Telefono
                TextFormField(
                  controller: telefonoController,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TText.phoneNo,
                    prefixIcon: Icon(CupertinoIcons.phone),
                    errorText: state.fieldErrors?["telefono"],
                  ),
                ),
                const SizedBox(height: TSize.spaceBtwInputFields),
                // Contraseña
                BlocBuilder<MostrarPasswordCubit, MostrarPasswordState>(
                  builder: (context, state) {
                    final registerState = context.watch<RegisterCubit>().state;
                    return TextFormField(
                      controller: passwordController,
                      obscureText: !state.isVisible,
                      expands: false,
                      decoration: InputDecoration(
                        labelText: TText.password,
                        prefixIcon: Icon(CupertinoIcons.lock),
                        errorText: registerState.fieldErrors?["password"],
                        suffixIcon: IconButton(
                          icon:
                              state.isVisible
                                  ? Icon(CupertinoIcons.eye)
                                  : Icon(CupertinoIcons.eye_slash),
                          onPressed: () {
                            context
                                .read<MostrarPasswordCubit>()
                                .alternarContra();
                          },
                          
                        ),
                        
                      ),
                    );
                  },
                ),
                const SizedBox(height: TSize.spaceBtwInputFields + 5),
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                            state.isLoading
                                ? null
                                : () {
                                  context.read<RegisterCubit>().register(
                                    nombreController.text,
                                    apellidoController.text,
                                    nombreUsuarioController.text,
                                    correoController.text,
                                    telefonoController.text,
                                    passwordController.text,
                                  );
                                },
                        child:
                            state.isLoading
                                ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                                : Text(TText.createAccount),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
