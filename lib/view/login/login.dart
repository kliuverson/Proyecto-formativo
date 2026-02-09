import 'package:ferremateriales/utils/constants/image_string.dart';
import 'package:ferremateriales/utils/constants/size.dart';
import 'package:ferremateriales/utils/constants/text_string.dart';
import 'package:ferremateriales/utils/helpers/helpers_functions.dart';
import 'package:ferremateriales/view/login/styles/spacing_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpersFunctions.esModoOscuro(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyleAppBar.paddingAppBar,
          child: Column(
            children: [
              //Logo, Titulo, Subtitulo
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    width: 200,
                    image: AssetImage(
                      dark ? TImage.darkLogo : TImage.lightLogo,
                    ),
                  ),
                  const SizedBox(height: TSize.defaultSpace),
                  Text(
                    TText.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: TSize.md),
                  Text(
                    TText.loginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              // Formulario Inicio Sesion
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: TSize.spaceBtwSections,
                  ),
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
                          TextButton(
                            onPressed: () {},
                            child: Text(TText.forgetPassword),
                          ),
                        ],
                      ),
                      const SizedBox(height: TSize.spaceBtwSections),

                      // Iniciar Sesion Boton
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(TText.signIn),
                        ),
                      ),
                      const SizedBox(height: TSize.md),
                      // Crear Cuenta Boton
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(TText.createAccount),
                        ),
                      ),

                      const SizedBox(height: TSize.spaceBtwSections),
                    ],
                  ),
                ),
              ),
              // Dividir Seccion
              Row(
                children: [
                  Flexible(
                    child: Divider(
                      color:
                          dark
                              ? const Color(0xFF757575)
                              : const Color(0xFF9E9E9E),
                      thickness: 1.0,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(
                    TText.orSignInWith,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Flexible(
                    child: Divider(
                      color:
                          dark
                              ? const Color(0xFF757575)
                              : const Color(0xFF9E9E9E),
                      thickness: 1.0,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSize.spaceBtwSections),
              // Pie de pagina
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image(
                        image: AssetImage(TImage.logoFacebook),
                        width: TSize.iconMd,
                        height: TSize.iconMd,
                      ),
                    ),
                  ),
                  const SizedBox(width: TSize.spaceBtwItems),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image(
                        image: AssetImage(TImage.logoGoogle),
                        width: TSize.iconMd,
                        height: TSize.iconMd,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
