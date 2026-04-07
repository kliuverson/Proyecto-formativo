import 'package:ferremateriales/utils/constants/size.dart';
import 'package:ferremateriales/utils/constants/text_string.dart';
import 'package:ferremateriales/view/login/cubit/mostrar_password_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TFormRegister extends StatelessWidget {
  const TFormRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                //Nombre
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TText.firstName,
                    prefixIcon: Icon(CupertinoIcons.person),
                  ),
                ),
              ),
              const SizedBox(width: TSize.spaceBtwInputFields),
              //Apellido
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TText.lastName,
                    prefixIcon: Icon(CupertinoIcons.person),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSize.spaceBtwInputFields),
          // Nombre de Usuario
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: TText.username,
              prefixIcon: Icon(CupertinoIcons.person_crop_circle),
            ),
          ),
          const SizedBox(height: TSize.spaceBtwInputFields),
          // Correo Electronico
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: TText.email,
              prefixIcon: Icon(CupertinoIcons.mail),
            ),
          ),
          const SizedBox(height: TSize.spaceBtwInputFields),
          // Numero de Telefono
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: TText.phoneNo,
              prefixIcon: Icon(CupertinoIcons.phone),
            ),
          ),
          const SizedBox(height: TSize.spaceBtwInputFields),
          // Contraseña
          BlocBuilder<MostrarPasswordCubit, MostrarPasswordState>(
            builder: (context, state) {
              return TextFormField(
                obscureText: !state.isVisible,
                expands: false,
                decoration: InputDecoration(
                  labelText: TText.password,
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
                ),
              );
            },
          ),
          const SizedBox(height: TSize.spaceBtwInputFields + 5),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(TText.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
