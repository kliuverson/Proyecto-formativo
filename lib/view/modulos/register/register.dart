import 'package:ferremateriales/common/form_divider.dart';
import 'package:ferremateriales/common/social_buttons.dart';
import 'package:ferremateriales/utils/constants/size.dart';
import 'package:ferremateriales/utils/constants/text_string.dart';
import 'package:ferremateriales/utils/helpers/helpers_functions.dart';
import 'package:ferremateriales/view/modulos/register/widget/register_form.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelpersFunctions.esModoOscuro(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(TSize.defaultSpace),
          child: Column(
            children: [
              // Titulo
              Text(
                TText.titleRegister,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSize.spaceBtwSections),
              // Formulario de Registro
              TFormRegister(),
              const SizedBox(height: TSize.spaceBtwSections),
              // Formulario Divider
              TDividerForm(isDark: isDark, dividerText: TText.orSignUpWith),
              const SizedBox(height: TSize.spaceBtwSections),
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
