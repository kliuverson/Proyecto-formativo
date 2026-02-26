import 'package:ferremateriales/view/modulos/favorites/pages/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:ferremateriales/src/injection_container.dart' as di;
import 'package:ferremateriales/utils/theme/theme.dart';
import 'package:ferremateriales/view/home/page/splash_page.dart';
import 'package:ferremateriales/view/login/login.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/cart_page.dart';
import 'package:ferremateriales/view/modulos/category/pages/Category_page.dart';
import 'package:ferremateriales/view/modulos/profile/pages/profile_page.dart';
import 'package:ferremateriales/view/modulos/about/page/about_page.dart';
import 'package:ferremateriales/view/modulos/address/pages/address_page.dart';
import 'package:ferremateriales/view/modulos/orders/pages/orders_pages.dart';
import 'package:ferremateriales/view/modulos/about/page/support/pages/support_page.dart';
import 'package:ferremateriales/view/modulos/modules/pages/modules_demo_page.dart';
import 'view/home/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
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

      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const Login(),
        '/favorite': (context) => const FavoritesPage(),
        '/profile': (context) => const ProfilePage(),
        '/cart': (context) => const CartPage(),
        '/category': (context) => const CategoryPage(),
        '/orders': (context) => const OrdersPage(),
        '/address': (context) => const AddressPage(),
        'about': (context) => const AboutPage(),
        '/support': (context) => const SupportPage(),
        '/modules_demo': (context) => const ModulesDemoPage(),
      },
    );
  }
}
