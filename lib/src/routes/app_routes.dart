import 'package:ferremateriales/view/modulos/admin/page/admin_page.dart';
import 'package:ferremateriales/view/modulos/modules/orders/pages/orders_pages.dart';
import 'package:ferremateriales/view/modulos/productos/pages/products_list_page.dart';
import 'package:ferremateriales/view/modulos/register/register.dart';
import 'package:flutter/material.dart';
import 'package:ferremateriales/view/home/page/home_page.dart';
import 'package:ferremateriales/view/login/login.dart';
import 'package:ferremateriales/view/modulos/category/pages/category_page.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/cart_page.dart';
import 'package:ferremateriales/view/modulos/profile/pages/profile_page.dart';
import 'package:ferremateriales/view/modulos/favorites/pages/favorite_page.dart';

class AppRoutes {
  static const home = '/home';
  static const login = '/login';
  static const cart = '/cart';
  static const category = '/category';
  static const profile = '/profile';
  static const favorite = '/favorite';
  static const orders = '/orders';
  static const register = '/register';
  static const products = '/products';
  static const admin = '/admin';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => const Login(),
    cart: (context) => const CartPage(),
    category: (context) => const CategoryPage(),
    profile: (context) => const ProfilePage(),
    favorite: (context) => const FavoritesPage(),
    orders: (context) => OrdersPage(),
    register: (context) => const RegisterScreen(),
    products: (context) => const ProductListPage(),
    admin: (context) => const CreateProductPage(),
  };
}
