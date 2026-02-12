import 'package:flutter/material.dart';

import 'package:ferremateriales/utils/theme/theme.dart';
import 'package:ferremateriales/view/home/page/splash_page.dart';
import 'package:ferremateriales/view/login/login.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/cart_page.dart';
import 'package:ferremateriales/view/modulos/category/pages/Category_page.dart';
import 'package:ferremateriales/view/modulos/favorites/pages/favorite_page.dart';
import 'package:ferremateriales/view/modulos/profile/pages/profile_page.dart';

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
      title: 'Ferremateriales DGC',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightAppTheme,
      darkTheme: TAppTheme.darkAppTheme,
        home: const SplashPage(),

      initialRoute: '/',

      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const Login(),
        '/favorite': (context) => const FavoritesPage(),
        '/profile': (context) => const ProfilePage(),
        '/cart': (context) => const CartPage(),
        '/category': (context) => const CategoryPage(),
      },
    );
  }
}
