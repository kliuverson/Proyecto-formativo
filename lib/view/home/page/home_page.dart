import 'package:flutter/material.dart';
import '../widgets/buscador.dart';
import '../widgets/categoria.dart';
import '../widgets/productos.dart';
import '../widgets/app_drawer.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void_openDrawer() {
    Scaffold.of(context).openDrawer();
  }

  void _openProfile() {
    debugPrint('Perfil');
  }

  void _openNotifications() {
    debugPrint('Notificaciones');
  }

void _onTabTapped(int index) {
  if (index == 0) {
    Navigator.pushNamed(context, '/home');
  } else if (index == 1) {
    Navigator.pushNamed(context, '/favorite');
  } else if (index == 2) {
    Navigator.pushNamed(context, '/cart');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(), 
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ferremateriales DGC'),
        leading: Builder(
          builder: (context) => IconButton(
             icon: const Icon(Icons.menu),
             onPressed: () => Scaffold.of(context).openDrawer(),
            ),
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

      ///  bottom navigation bar
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
