import 'package:flutter/material.dart';
import '../widgets/buscador.dart';
import '../widgets/categoria.dart';
import '../widgets/productos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _openMenu() {
    debugPrint('Menú hamburguesa');
  }

  void _openProfile() {
    debugPrint('Perfil');
  }

  void _openNotifications() {
    debugPrint('Notificaciones');
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    debugPrint('Tab seleccionado: $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ferremateriales D.C.G'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _openMenu,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: _openNotifications,
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: _openProfile,
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Buscador(),
            SizedBox(height: 16),
            Categoria(),
            SizedBox(height: 16),
            Productos(),
          ],
        ),
      ),

      /// 🔽 Barra inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
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
        ],
      ),
    );
  }
}
