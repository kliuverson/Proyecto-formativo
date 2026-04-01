import 'package:ferremateriales/utils/constants/size.dart';
import 'package:ferremateriales/utils/constants/text_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
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
            ),
            const SizedBox(height: TSize.spaceBtwInputFields),

            // Contraseña
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.lock),
                suffixIcon: Icon(CupertinoIcons.eye_slash),
                labelText: TText.password,
              ),
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
                TextButton(onPressed: () {}, child: Text(TText.forgetPassword)),
              ],
            ),
            const SizedBox(height: TSize.spaceBtwSections),

            // Iniciar Sesion Boton
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/home"),
                child: Text(TText.signIn),
              ),
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
    );
  }
}
