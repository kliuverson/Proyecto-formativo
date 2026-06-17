import 'package:ferremateriales/common/widgets/language_selector.dart';
import 'package:ferremateriales/common/widgets/text/section_heading.dart';
import 'package:ferremateriales/cubit/theme_cubit.dart';
import 'package:ferremateriales/src/routes/app_routes.dart';
import 'package:ferremateriales/utils/constants/size.dart';
import 'package:ferremateriales/view/modulos/profile/models/profile_user_model.dart';
import 'package:ferremateriales/view/modulos/profile/widgets/setting_menu_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

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
    final tr = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.all(TSize.defaultSpace),
      child: Column(
        children: [
          /// CUENTA
          TSectionHeading(title: tr.accountSettings),
          const SizedBox(height: TSize.spaceBtwItems),

          TSettingMenuList(
            icon: CupertinoIcons.person,
            title: tr.profileTitle,
            subtitle: tr.profileSubtitle,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.editProfile, arguments: user);
            },
          ),

          TSettingMenuList(
            icon: CupertinoIcons.house,
            title: tr.myAddresses,
            subtitle: tr.myAddressesSubtitle,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.address);
            },
          ),

          TSettingMenuList(
            icon: CupertinoIcons.lock,
            title: tr.security,
            subtitle: tr.securitySubtitle,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.forgotPassword);
            },
          ),

          const SizedBox(height: TSize.spaceBtwSections),

          /// COMPRAS
          TSectionHeading(title: tr.purchases),
          const SizedBox(height: TSize.spaceBtwItems),

          TSettingMenuList(
            icon: CupertinoIcons.bag,
            title: tr.myOrders,
            subtitle: tr.myOrdersSubtitle,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.orders);
            },
          ),

          TSettingMenuList(
            icon: CupertinoIcons.heart,
            title: tr.myFavorites,
            subtitle: tr.myFavoritesSubtitle,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.favorite);
            },
          ),

          const SizedBox(height: TSize.spaceBtwSections),

          /// PREFERENCIAS
          TSectionHeading(title: tr.preferences),
          const SizedBox(height: TSize.spaceBtwItems),

          TSettingMenuList(
            icon: CupertinoIcons.globe,
            title: tr.language,
            subtitle: tr.languageSubtitle,
            onTap: () {
              showLanguageSelector(context);
            },
          ),

          /// MODO OSCURO con switch
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              final isDark = themeMode == ThemeMode.dark;
              return TSettingMenuList(
                icon: isDark ? CupertinoIcons.sun_max : CupertinoIcons.moon,
                title: tr.darkMode,
                subtitle: isDark ? tr.darkModeSubtitleOn : tr.darkModeSubtitleOff,
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
          TSectionHeading(title: tr.support),
          const SizedBox(height: TSize.spaceBtwItems),

          TSettingMenuList(
            icon: CupertinoIcons.question_circle,
            title: tr.helpCenter,
            subtitle: tr.helpCenterSubtitle,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.centroAyuda);
            },
          ),

          TSettingMenuList(
            icon: CupertinoIcons.doc_text,
            title: tr.termsAndConditions,
            subtitle: tr.termsAndConditionsSubtitle,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.terminos);
            },
          ),

          TSettingMenuList(
            icon: CupertinoIcons.shield,
            title: tr.privacyPolicyTitle,
            subtitle: tr.privacyPolicySubtitle,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.privacidad);
            },
          ),

          const SizedBox(height: TSize.spaceBtwSections),

          /// LOGOUT
          TSettingMenuList(
            icon: CupertinoIcons.square_arrow_right,
            title: tr.logout,
            subtitle: tr.logoutSubtitle,
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

