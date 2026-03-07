import 'package:ferremateriales/utils/theme/custom_theme/app_bar_theme.dart';
import 'package:ferremateriales/utils/theme/custom_theme/check_box_theme.dart';
import 'package:ferremateriales/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:ferremateriales/utils/theme/custom_theme/outline_border_theme.dart';
import 'package:ferremateriales/utils/theme/custom_theme/text_field_theme.dart';
import 'package:ferremateriales/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme{
  TAppTheme._();

  static ThemeData lightAppTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.orange,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.ligthElevatedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.ligthTextFieldTheme,
    outlinedButtonTheme: TOutlinedBorderTheme.ligthOutlinedButtonTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxThemeData
  );

   static ThemeData darkAppTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.orange,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkTextFieldTheme,
    outlinedButtonTheme: TOutlinedBorderTheme.darkOutlinedButtonTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxThemeData
  );
}