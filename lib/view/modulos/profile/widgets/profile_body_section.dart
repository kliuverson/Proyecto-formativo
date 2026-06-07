import 'package:ferremateriales/common/widgets/text/section_heading.dart';
import 'package:ferremateriales/cubit/theme_cubit.dart';
import 'package:ferremateriales/src/routes/app_routes.dart';
import 'package:ferremateriales/utils/constants/size.dart';
import 'package:ferremateriales/view/modulos/profile/models/profile_user_model.dart';
import 'package:ferremateriales/view/modulos/profile/widgets/setting_menu_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBodySection extends StatelessWidget {
  final VoidCallback onTap;

  const ProfileBodySection({
    super.key,
    required this.user,
    required this.onTap,
  });

  final UserProfileModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(TSize.defaultSpace),
      child: Column(
        children: [
          /// CUENTA
          const TSectionHeading(title: "Configuración de la cuenta"),
          const SizedBox(height: TSize.spaceBtwItems),

          TSettingMenuList(
            icon: CupertinoIcons.person,
            title: "Perfil",
            subtitle: "Actualiza tu información personal",
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.editProfile, arguments: user);
            },
          ),

          TSettingMenuList(
            icon: CupertinoIcons.house,
            title: "Mis direcciones",
            subtitle: "Agrega tus direcciones de entrega",
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.address);
            },
          ),

          TSettingMenuList(
            icon: CupertinoIcons.creditcard,
            title: "Métodos de pago",
            subtitle: "Administra tus tarjetas",
          ),

          TSettingMenuList(
            icon: CupertinoIcons.lock,
            title: "Seguridad",
            subtitle: "Cambiar contraseña",
          ),

          const SizedBox(height: TSize.spaceBtwSections),

          /// COMPRAS
          const TSectionHeading(title: "Compras"),
          const SizedBox(height: TSize.spaceBtwItems),

          TSettingMenuList(
            icon: CupertinoIcons.bag,
            title: "Mis pedidos",
            subtitle: "Consulta tu historial de compras",
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.orders);
            },
          ),

          TSettingMenuList(
            icon: CupertinoIcons.heart,
            title: "Favoritos",
            subtitle: "Productos guardados",
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.favorite);
            },
          ),

          TSettingMenuList(
            icon: CupertinoIcons.ticket,
            title: "Cupones",
            subtitle: "Descuentos disponibles",
          ),

          const SizedBox(height: TSize.spaceBtwSections),

          /// PREFERENCIAS
          const TSectionHeading(title: "Preferencias"),
          const SizedBox(height: TSize.spaceBtwItems),

          TSettingMenuList(
            icon: CupertinoIcons.bell,
            title: "Notificaciones",
            subtitle: "Configura alertas",
          ),

          TSettingMenuList(
            icon: CupertinoIcons.globe,
            title: "Idioma",
            subtitle: "Selecciona tu idioma",
          ),

          /// MODO OSCURO con switch
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              final isDark = themeMode == ThemeMode.dark;
              return TSettingMenuList(
                icon: isDark ? CupertinoIcons.sun_max : CupertinoIcons.moon,
                title: "Modo oscuro",
                subtitle: isDark ? "Apariencia oscura activa" : "Cambiar apariencia",
                trailing: CupertinoSwitch(
                  value: isDark,
                  activeTrackColor: Colors.orange,
                  onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
                ),
              );
            },
          ),

          const SizedBox(height: TSize.spaceBtwSections),

          /// SOPORTE
          const TSectionHeading(title: "Soporte"),
          const SizedBox(height: TSize.spaceBtwItems),

          TSettingMenuList(
            icon: CupertinoIcons.question_circle,
            title: "Centro de ayuda",
            subtitle: "Soporte y preguntas frecuentes",
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.centroAyuda);
            },
          ),

          TSettingMenuList(
            icon: CupertinoIcons.doc_text,
            title: "Términos y condiciones",
            subtitle: "Información legal",
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.terminos);
            },
          ),

          TSettingMenuList(
            icon: CupertinoIcons.shield,
            title: "Política de privacidad",
            subtitle: "Cómo protegemos tus datos",
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.privacidad);
            },
          ),

          const SizedBox(height: TSize.spaceBtwSections),

          /// LOGOUT
          TSettingMenuList(
            icon: CupertinoIcons.square_arrow_right,
            title: "Cerrar sesión",
            subtitle: "Salir de la cuenta",
            onTap: () {
              onTap();
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}