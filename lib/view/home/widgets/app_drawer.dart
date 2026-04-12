import 'package:ferremateriales/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    final isAuthenticated = authState.isAuthenticated;

    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            /// ===== HEADER =====
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Ferremateriales DGC",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Tu ferretería de confianza",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            /// 🏠 INICIO
            _item(
              context,
              icon: Icons.home,
              text: "Inicio",
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),

            /// 📂 CATEGORÍAS
            _item(
              context,
              icon: Icons.category,
              text: "Categorías",
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/category');
              },
            ),

            /// 🛒 CARRITO
            _item(
              context,
              icon: Icons.shopping_cart,
              text: "Mi Carrito",
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
                text: "Mis Favoritos",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/favorite');
                },
              ),

            /// 📦 PEDIDOS (YA AGREGADO 🔥)
            if (isAuthenticated)
              _item(
                context,
                icon: Icons.receipt_long,
                text: "Mis Pedidos",
                onTap: () {
                  Navigator.pop(context); // 👈 cerrar drawer
                  Navigator.pushNamed(context, '/orders');
                },
              ),

            /// 👤 MI CUENTA
            _item(
              context,
              icon: Icons.person,
              text: "Mi Cuenta",
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
                text: "Direcciones",
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
              text: "Acerca de Nosotros",
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),

            /// 🎧 SOPORTE
            _item(
              context,
              icon: Icons.support_agent,
              text: "Contacto / Soporte",
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/support');
              },
            ),

            const Divider(),

            /// 🚪 LOGOUT
            if (isAuthenticated)
              _item(
                context,
                icon: Icons.logout,
                text: "Cerrar Sesión",
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
    final rootContext = Navigator.of(context).context;

    showDialog(
      context: rootContext,
      builder:
          (_) => AlertDialog(
            title: const Text("Cerrar sesión"),
            content: const Text("¿Seguro que deseas salir?"),
            actions: [
              TextButton(
                child: const Text("Cancelar"),
                onPressed: () => Navigator.pop(rootContext),
              ),
              SizedBox(
                height: 40,
                width: 80,
                child: ElevatedButton(
                  child: const Text("Salir"),
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
