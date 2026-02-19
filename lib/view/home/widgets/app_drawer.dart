import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  // 🔐 Cambia esto por tu sistema real de login
  bool get isAuthenticated => true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            // ===== HEADER =====
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
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

            // incio 
            _item(
              context,
              icon: Icons.home,
              text: "Inicio",
              onTap: () => Navigator.pushNamed(context, '/home'),
            ),

            // categorías
            _item(
              context,
              icon: Icons.category,
              text: "Categorías",
              onTap: () => Navigator.pushNamed(context, '/category'),
            ),

            // carrito
            _item(
              context,
              icon: Icons.shopping_cart,
              text: "Mi Carrito",
              onTap: () => Navigator.pushNamed(context, '/cart'),
            ),

            // favoritos solo si está autenticado
            if (isAuthenticated)
              _item(
                context,
                icon: Icons.favorite,
                text: "Mis Favoritos",
                onTap: () => Navigator.pushNamed(context, '/favorite'),
              ),

            // mi cuenta 
            _item(
              context,
              icon: Icons.person,
              text: "Mi Cuenta",
              onTap: () {
                if (isAuthenticated) {
                  Navigator.pushNamed(context, '/profile');
                } else {
                  Navigator.pushNamed(context, '/login');
                }
              },
            ),

            // pedidos (solo si login)
            if (isAuthenticated)
              _item(
                context,
                icon: Icons.receipt_long,
                text: "Mis Pedidos",
                onTap: () => Navigator.pushNamed(context, '/orders'),
              ),

            // direcciones (solo si login)
            if (isAuthenticated)
              _item(
                context,
                icon: Icons.location_on,
                text: "Direcciones",
                onTap: () => Navigator.pushNamed(context, '/address'),
              ),

            const Divider(),

            // acerca de nosortros
            _item(
              context,
              icon: Icons.info,
              text: "Acerca de Nosotros",
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),

            // contacto y soporte
            _item(
              context,
              icon: Icons.support_agent,
              text: "Contacto / Soporte",
              onTap: () => Navigator.pushNamed(context, '/support'),
            ),

            const Divider(),

            // cerrar sesión solo si está autenticado
            if (isAuthenticated)
              _item(
                context,
                icon: Icons.logout,
                text: "Cerrar Sesión",
                onTap: () => _confirmLogout(context),
                color: Colors.red,
              ),
          ],
        ),
      ),
    );
  }

  //  item reutilizable
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

  //  Confirmación de logout
  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Cerrar sesión"),
        content: const Text("¿Seguro que deseas salir?"),
        actions: [
          TextButton(
            child: const Text("Cancelar"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text("Salir"),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
