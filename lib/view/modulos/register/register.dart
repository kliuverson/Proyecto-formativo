import 'package:ferremateriales/utils/constants/size.dart';
import 'package:ferremateriales/utils/constants/text_string.dart';
import 'package:ferremateriales/view/login/styles/spacing_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyleAppBar.paddingAppBar,
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    CupertinoIcons.person_2,
                    color: Colors.white,
                    size: TSize.iconLg,
                  ),
                ),
              ),
              const SizedBox(height: TSize.sm),
              Center(
                child: Text(
                  "Crear Cuenta",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(height: TSize.xs),
              Center(
                child: Text(
                  "Registrate para empezar a comprar",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),

              // Formulario de Registro
              Form(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: TSize.spaceBtwSections,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nombre Completo",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: TSize.sm),
                      // Nombre completo
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.mail),
                          labelText: TText.email,
                          hintText: TText.emailExample,
                        ),
                      ),
                      const SizedBox(height: TSize.spaceBtwItems),
                      Text("Correo Electronico"),
                      const SizedBox(height: TSize.sm),
                      // Correo electronico
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.mail),
                          labelText: TText.email,
                          hintText: TText.emailExample,
                        ),
                      ),
                      const SizedBox(height: TSize.spaceBtwItems),
                      Text(
                        "Telefono",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: TSize.sm),
                      // Telefono
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.mail),
                          labelText: TText.email,
                          hintText: TText.emailExample,
                        ),
                      ),
                      const SizedBox(height: TSize.spaceBtwItems),
                      Text(
                        "Contraseña",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: TSize.sm),
                      // Contraseña
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.mail),
                          labelText: "Minimo 8 caracteres",
                          hintText: TText.emailExample,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
