import 'package:flutter/material.dart';
import 'package:ferremateriales/src/injection_container.dart' as di;
import 'package:ferremateriales/src/data/module_repository.dart';
import 'package:ferremateriales/src/models/module_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../widgets/buscador.dart';
import '../widgets/categoria.dart';
import '../widgets/productos.dart';
import '../widgets/app_drawer.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class ModulesList extends StatelessWidget {
  final int? limit;

  const ModulesList({super.key, this.limit});

  @override
  Widget build(BuildContext context) {
    final ModuleRepository repo = di.sl<ModuleRepository>();
    return FutureBuilder<List<ModuleModel>>(
      future: repo.getModules(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Error al cargar módulos: ${snapshot.error}'),
          );
        }

        // After ensuring box is populated, listen to changes and build from the box
        return ValueListenableBuilder<Box>(
          valueListenable: Hive.box('modules').listenable(),
          builder: (context, box, _) {
            final modules = box.values.whereType<ModuleModel>().toList();
            if (modules.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('No hay módulos disponibles'),
              );
            }

            final display = limit != null ? modules.take(limit!).toList() : modules;

            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: display.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final m = display[index];
                return ListTile(
                  title: Text(m.title),
                  subtitle: Text(m.description),
                  trailing: Text('\$${m.price.toStringAsFixed(2)}'),
                );
              },
            );
          },
        );
      },
    );
  }
}

class _HomePageState extends State<HomePage> {
  final int _currentIndex = 0;

  void _openDrawer(BuildContext context){
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
             onPressed: () => _openDrawer(context)
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
          children: [
            const Buscador(),
            const SizedBox(height: 16),
            const Categoria(),
            const SizedBox(height: 16),
            const Productos(),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text('Módulos locales', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 8),
            ModulesList(limit: 3),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/modules_demo'),
                child: const Text('Ver todos'),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/modules_demo'),
        icon: const Icon(Icons.storage),
        label: const Text('Demo local'),
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
