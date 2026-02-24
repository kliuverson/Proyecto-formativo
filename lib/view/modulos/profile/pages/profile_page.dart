import 'package:ferremateriales/common/widgets/appbar/app_bar.dart';
import 'package:ferremateriales/common/widgets/coustom_shapes/containers/primary_header_container.dart';
import 'package:ferremateriales/common/widgets/text/section_heading.dart';
import 'package:ferremateriales/utils/constants/size.dart';
import 'package:ferremateriales/view/modulos/profile/widgets/setting_menu_list.dart';
import 'package:ferremateriales/view/modulos/profile/widgets/user_profile_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --Encabezado
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppbar(
                    iconColor: Colors.white,
                    showBackArrow: true,
                    title: Text(
                      "Mi cuenta",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: Colors.white),
                    ),
                  ),

                  TUserProfile(),
                  const SizedBox(height: 30),
                ],
              ),
            ),

            /// --Cuerpo
            Padding(
              padding: EdgeInsets.all(TSize.defaultSpace),
              child: Column(
                children: [
                  /// --- CUENTA
                  const TSectionHeading(title: "Configuración de la cuenta"),
                  const SizedBox(height: TSize.spaceBtwItems),

                  TSettingMenuList(
                    icon: CupertinoIcons.person,
                    title: "Perfil",
                    subtitle: "Actualiza tu información personal",
                  ),

                  TSettingMenuList(
                    icon: CupertinoIcons.house,
                    title: "Mis direcciones",
                    subtitle: "Agrega tus direcciones de entrega",
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

                  /// --- COMPRAS
                  TSectionHeading(title: "Compras"),
                  const SizedBox(height: TSize.spaceBtwItems),

                  TSettingMenuList(
                    icon: CupertinoIcons.bag,
                    title: "Mis pedidos",
                    subtitle: "Consulta tu historial de compras",
                  ),

                  TSettingMenuList(
                    icon: CupertinoIcons.heart,
                    title: "Favoritos",
                    subtitle: "Productos guardados",
                  ),

                  TSettingMenuList(
                    icon: CupertinoIcons.ticket,
                    title: "Cupones",
                    subtitle: "Descuentos disponibles",
                  ),

                  const SizedBox(height: TSize.spaceBtwSections),

                  /// --- PREFERENCIAS
                  TSectionHeading(title: "Preferencias"),
                  SizedBox(height: TSize.spaceBtwItems),

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

                  TSettingMenuList(
                    icon: CupertinoIcons.moon,
                    title: "Modo oscuro",
                    subtitle: "Cambiar apariencia",
                  ),

                  const SizedBox(height: TSize.spaceBtwSections),

                  /// --- SOPORTE
                  TSectionHeading(title: "Soporte"),
                  SizedBox(height: TSize.spaceBtwItems),

                  TSettingMenuList(
                    icon: CupertinoIcons.question_circle,
                    title: "Centro de ayuda",
                    subtitle: "Soporte y preguntas frecuentes",
                  ),

                  TSettingMenuList(
                    icon: CupertinoIcons.doc_text,
                    title: "Términos y condiciones",
                    subtitle: "Información legal",
                  ),

                  TSettingMenuList(
                    icon: CupertinoIcons.shield,
                    title: "Política de privacidad",
                    subtitle: "Cómo protegemos tus datos",
                  ),

                  const SizedBox(height: TSize.spaceBtwSections),

                  /// --- LOGOUT
                  TSettingMenuList(
                    icon: CupertinoIcons.square_arrow_right,
                    title: "Cerrar sesión",
                    subtitle: "Salir de la cuenta",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
