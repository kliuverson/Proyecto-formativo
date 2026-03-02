import '../widgets/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:ferremateriales/src/injection_container.dart' as di;
import 'package:ferremateriales/src/data/module_repository.dart';
import 'package:ferremateriales/src/models/module_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../widgets/buscador.dart';
import '../widgets/category_grid.dart';
import '../widgets/productos.dart';
import '../widgets/app_drawer.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_bottom_nav.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/cart_page.dart'; // Importa tu CartPage real

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _openNotifications() {
    debugPrint('Notificaciones');
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      key: _scaffoldKey,
      drawer: const AppDrawer(),

      /// 🔹 APPBAR EXTERNO
      appBar: HomeAppBar(
        onMenu: _openDrawer,
        onNotifications: _openNotifications,
      ),

      /// 🔹 BODY (IndexedStack por pestañas)
      // Los children del IndexedStack ahora coinciden con el orden de los ítems en HomeBottomNav:
      // 0: Inicio, 1: Favoritos, 2: Carrito, 3: Categorías (completa), 4: Perfil
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Pestaña 0: Inicio (scrollable con contenido principal)
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Buscador(),
                const SizedBox(height: 20),
                const BannerCarousel(),
                const SizedBox(height: 24),
                const CategoriesGrid(),
                const SizedBox(height: 20),
                const Productos(),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 12),
                const Text(
                  'Módulos locales',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ModulesList(limit: 3),
              ],
            ),
          ),

          // Pestaña 1: Favoritos (Ahora es la segunda pestaña)
          const Center(
            child: Text('Favoritos', style: TextStyle(fontSize: 18)),
          ),

          // Pestaña 2: Carrito (Ahora es la tercera pestaña, y usa tu CartPage real)
          const CartPage(),

          // Pestaña 3: Categorías (Ahora es la cuarta pestaña)
          const Center(
            child: Text('Vista de Categorías (completa)', style: TextStyle(fontSize: 18)),
          ),

          // Pestaña 4: Perfil (Ahora es la quinta pestaña)
          const Center(
            child: Text('Perfil', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),

      /// 🔹 FLOATING BUTTON
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/modules_demo'),
        icon: const Icon(Icons.storage),
        label: const Text('Demo local'),
      ),

      /// 🔹 BOTTOM NAV SEPARADO
      bottomNavigationBar: HomeBottomNav(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

/// 🔹 MÓDULOS LISTA (Hive + Repository)
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

        return ValueListenableBuilder<Box>(
          valueListenable: Hive.box('modules').listenable(),
          builder: (context, box, _) {
            final modules =
                box.values.whereType<ModuleModel>().toList();

            if (modules.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('No hay módulos disponibles'),
              );
            }

            final display =
                limit!= null? modules.take(limit!).toList() : modules;

            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: display.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1),
              itemBuilder: (context, index) {
                final m = display[index];

                return ListTile(
                  title: Text(m.title),
                  subtitle: Text(m.description),
                  trailing:
                      Text('\$${m.price.toStringAsFixed(2)}'),
                );
              },
            );
          },
        );
      },
    );
  }
}