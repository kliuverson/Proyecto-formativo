import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/src/routes/app_routes.dart';

import '../widgets/banner_carousel.dart';
import '../widgets/category_grid.dart';
import '../widgets/productos.dart';
import '../widgets/app_drawer.dart';
import '../cubit/search_product_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  void onTap(int index) {

    setState(() {
      currentIndex = index;
    });

    switch(index){

      case 0:
        Navigator.pushNamed(context, AppRoutes.home);
        break;

      case 1:
        Navigator.pushNamed(context, AppRoutes.category);
        break;

      case 2:
        Navigator.pushNamed(context, AppRoutes.favorite);
        break;

      case 3:
        Navigator.pushNamed(context, AppRoutes.cart);
        break;

      case 4:
        Navigator.pushNamed(context, AppRoutes.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => SearchProductCubit(),
      child: Scaffold(

        /// MENU LATERAL
        drawer: const AppDrawer(),

        body: CustomScrollView(
          slivers: [

            /// APPBAR ESTILO AMAZON
            SliverAppBar(
              pinned: true,
              expandedHeight: 120,
              backgroundColor: const Color.fromARGB(255, 255, 106, 20),

              /// MENU HAMBURGUESA
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),

              flexibleSpace: FlexibleSpaceBar(
                background: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// TITULO
                        const Padding(
                          padding: EdgeInsets.only(left: 56, top: 8),
                          child: Text(
                            "FerreMateriales",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        /// BUSCADOR
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              context.read<SearchProductCubit>().searchProducts(value, []);
                            },
                            decoration: const InputDecoration(
                              hintText: "Buscar herramientas...",
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /// BANNER PROMOCIONAL
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: BannerCarousel(),
              ),
            ),

            /// CATEGORÍAS
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CategoryGrid(),
              ),
            ),

            /// PRODUCTOS DESTACADOS
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<SearchProductCubit, List>(
                  builder: (context, filteredProducts) {

                    if (filteredProducts.isEmpty) {
                      return const Center(
                        child: Text("No se encontraron productos"),
                      );
                    }

                    return const Productos();

                  },
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 40),
            ),

          ],
        ),

        /// MENÚ INFERIOR
        bottomNavigationBar: BottomNavigationBar(

          currentIndex: currentIndex,
          onTap: onTap,

          type: BottomNavigationBarType.fixed,

          items: const [

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Inicio",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categorías",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favoritos",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Carrito",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Perfil",
            ),
          ],
        ),
      ),
    );
  }
}