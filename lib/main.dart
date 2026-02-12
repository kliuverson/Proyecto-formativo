import 'package:ferremateriales/utils/theme/theme.dart';
import 'package:ferremateriales/view/login/login.dart';
import 'package:flutter/material.dart';
import 'view/home/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ferremateriales ',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightAppTheme,
      darkTheme: TAppTheme.darkAppTheme,
      home: HomePage(),
    );
  }
}
