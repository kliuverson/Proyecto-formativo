// app_routes.dart
import 'package:ferremateriales/service/auth_service.dart';
import 'package:ferremateriales/view/login/cubit/cubit/forgot_password_cubit.dart';
import 'package:ferremateriales/view/login/views/forgot_password_page.dart';
import 'package:ferremateriales/view/modulos/admin/page/dashboard_page.dart';
import 'package:ferremateriales/view/modulos/about/page/acerca_de_nosotros_page.dart';
import 'package:ferremateriales/view/modulos/soporte/pages/contacto_page.dart';
import 'package:ferremateriales/view/modulos/soporte/pages/centro_ayuda_page.dart';
import 'package:ferremateriales/view/modulos/soporte/pages/privacidad_page.dart';
import 'package:ferremateriales/view/modulos/soporte/pages/terminos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/view/home/page/home_page.dart';
import 'package:ferremateriales/view/login/login.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/cart_page.dart';
import 'package:ferremateriales/view/modulos/category/pages/category_page.dart';
import 'package:ferremateriales/view/modulos/favorites/pages/favorite_page.dart';
import 'package:ferremateriales/view/modulos/orders/pages/orders_page.dart';
import 'package:ferremateriales/view/modulos/productos/pages/products_list_page.dart';
import 'package:ferremateriales/view/modulos/productos/pages/products_by_category_page.dart';
import 'package:ferremateriales/view/modulos/profile/pages/profile_page.dart';
import 'package:ferremateriales/view/modulos/profile/pages/edit_profile_page.dart';
import 'package:ferremateriales/view/modulos/profile/cubit/profile_cubit.dart';
import 'package:ferremateriales/view/modulos/profile/models/profile_user_model.dart';
import 'package:ferremateriales/view/modulos/register/register.dart';
import 'package:ferremateriales/view/modulos/category/cubit/category_product_cubit.dart';
import 'package:ferremateriales/view/modulos/address/pages/address_page.dart';

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
  static const editProfile = '/edit-profile';
  static const productsByCategory = '/productsByCategory';
  static const address = '/address';
  static const centroAyuda = '/centro-ayuda';
  static const terminos = '/terminos';
  static const privacidad = '/privacidad';
  static const acercaDeNosotros = '/acerca-de-nosotros';
  static const contacto = '/contacto';
  static const forgotPassword = '/forgot-password';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),

    login: (context) => const Login(),

    cart: (context) => const CartPage(),

    category: (context) => const CategoryPage(),

    profile:
        (context) => BlocProvider.value(
          value: context.read<ProfileCubit>(),
          child: const ProfilePage(),
        ),

    editProfile: (context) {
      final user =
          ModalRoute.of(context)!.settings.arguments as UserProfileModel;
      return EditProfilePage(user: user);
    },

    favorite: (context) => const FavoritesPage(),

    orders: (context) => OrdersPage(),

    register: (context) => const RegisterScreen(),

    products: (context) => const ProductListPage(),

    address: (context) => const AddressPage(),

    centroAyuda: (context) => const CentroAyudaPage(),

    terminos: (context) => const TerminosPage(),

    privacidad: (context) => const PrivacidadPage(),

    acercaDeNosotros: (context) => const AcercaDeNosotrosPage(),

    contacto: (context) => const ContactoPage(),

    admin: (context) => const AdminDashboardPage(),

    productsByCategory: (context) {
      final args = ModalRoute.of(context)!.settings.arguments;

      if (args == null || args is! String) {
        return const CategoryPage();
      }

      final categoryName = args.toString();

      return BlocProvider(
        create:
            (_) => CategoryProductCubit()..loadProductsByCategory(categoryName),
        child: ProductsByCategoryPage(categoryName: categoryName),
      );
    },

    forgotPassword:
        (context) => BlocProvider(
          create: (_) => ForgotPasswordCubit(authService: AuthService()),
          child: const ForgotPasswordPage(),
        ),
  };
}
