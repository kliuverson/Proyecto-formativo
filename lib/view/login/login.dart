import 'package:ferremateriales/common/form_divider.dart';
import 'package:ferremateriales/common/social_buttons.dart';
import 'package:ferremateriales/service/auth_service.dart';
import 'package:ferremateriales/utils/constants/size.dart';
import 'package:ferremateriales/utils/constants/text_string.dart';
import 'package:ferremateriales/utils/helpers/helpers_functions.dart';
import 'package:ferremateriales/view/login/cubit/cubit/login_cubit.dart';
import 'package:ferremateriales/view/login/cubit/mostrar_password_cubit.dart';
import 'package:ferremateriales/view/login/styles/spacing_style.dart';
import 'package:ferremateriales/view/login/widgets/login_form.dart';
import 'package:ferremateriales/view/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelpersFunctions.esModoOscuro(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyleAppBar.paddingAppBar,
          child: Column(
            children: [
              //Logo, Titulo, Subtitulo
              TLoginHeader(isDark: isDark),
              // Formulario Inicio Sesion
              MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => MostrarPasswordCubit()),
                  BlocProvider(create: (context) => LoginCubit(authService: AuthService())),
                ],
                child: TLoginForm(),
              ),
              // Dividir Seccion
              TDividerForm(isDark: isDark, dividerText: TText.orSignInWith),
              const SizedBox(height: TSize.spaceBtwSections),
              // Pie de pagina
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
