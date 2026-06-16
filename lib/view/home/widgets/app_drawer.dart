import 'package:ferremateriales/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    final authState = context.watch<AuthCubit>().state;
    final isAuthenticated = authState.isAuthenticated;

    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            /// ===== HEADER =====
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.orange),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    tr.appName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    tr.appSlogan,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            /// 🏠 INICIO
            _item(
              context,
              icon: Icons.home,
              text: tr.drawerHome,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),

            /// 📂 CATEGORÍAS
            _item(
              context,
              icon: Icons.category,
              text: tr.drawerCategories,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/category');
              },
            ),

            /// 🛍️ PRODUCTOS
            _item(
              context,
              icon: Icons.store,
              text: tr.drawerProducts,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/products');
              },
            ),

            /// 🛒 CARRITO
            _item(
              context,
              icon: Icons.shopping_cart,
              text: tr.drawerCart,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart');
              },
            ),

            /// ❤️ FAVORITOS (solo si login)
            if (isAuthenticated)
              _item(
                context,
                icon: Icons.favorite,
                text: tr.drawerFavorites,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/favorite');
                },
              ),

            /// 📦 PEDIDOS
            if (isAuthenticated)
              _item(
                context,
                icon: Icons.receipt_long,
                text: tr.drawerOrders,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/orders');
                },
              ),

            /// 👤 MI CUENTA
            _item(
              context,
              icon: Icons.person,
              text: tr.drawerAccount,
              onTap: () {
                Navigator.pop(context);

                if (isAuthenticated) {
                  Navigator.pushNamed(context, '/profile');
                } else {
                  Navigator.pushNamed(context, '/login');
                }
              },
            ),

            /// 📍 DIRECCIONES (solo si login)
            if (isAuthenticated)
              _item(
                context,
                icon: Icons.location_on,
                text: tr.drawerAddresses,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/address');
                },
              ),

            const Divider(),

            /// ℹ️ ACERCA DE
            _item(
              context,
              icon: Icons.info,
              text: tr.drawerAbout,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/acerca-de-nosotros');
              },
            ),

            /// 🎧 SOPORTE
            _item(
              context,
              icon: Icons.support_agent,
              text: tr.drawerSupport,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contacto');
              },
            ),

            const Divider(),

            /// 🚪 LOGOUT
            if (isAuthenticated)
              _item(
                context,
                icon: Icons.logout,
                text: tr.drawerLogout,
                color: Colors.red,
                onTap: () {
                  _confirmLogout(context);
                },
              ),
          ],
        ),
      ),
    );
  }

  /// 🔹 ITEM REUTILIZABLE
  Widget _item(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onTap,
    );
  }

  /// 🔐 CONFIRMAR LOGOUT
  void _confirmLogout(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    final rootContext = Navigator.of(context).context;

    showDialog(
      context: rootContext,
      builder:
          (_) => AlertDialog(
            title: Text(tr.logoutTitle),
            content: Text(tr.logoutConfirm),
            actions: [
              TextButton(
                child: Text(tr.cancel),
                onPressed: () => Navigator.pop(rootContext),
              ),
              SizedBox(
                height: 40,
                width: 80,
                child: ElevatedButton(
                  child: Text(tr.exit),
                  onPressed: () {
                    Navigator.pop(rootContext);
                    Navigator.pop(context);

                    rootContext.read<AuthCubit>().logout();

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
    );
  }
}

