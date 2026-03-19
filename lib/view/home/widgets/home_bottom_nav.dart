import 'package:flutter/material.dart';


class HomeBottomNav extends StatelessWidget {
  final int currentIndex;

  const HomeBottomNav({super.key, required this.currentIndex});

  void _onTap(BuildContext context, int index) {
    String route = '/home';
    switch (index) {
      case 0:
        route = '/home';
        break;
      case 1:
        route = '/favorite';
        break;
      case 2:
        route = '/cart';
        break;
      case 3:
        route = '/category';
        break;
      case 4:
        route = '/profile';
        break;
    }

    // Reemplaza la pantalla actual y evita apilar rutas
    Navigator.pushNamedAndRemoveUntil(context, route,(route) => false,);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[900],
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey[400],
      currentIndex: currentIndex,
      onTap: (index) => _onTap(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Carrito',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          label: 'Categorías',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Perfil',
        ),
      ],
    );
  }
}