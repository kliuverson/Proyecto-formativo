import 'package:ferremateriales/view/modulos/category/widgets/category_grid.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:ferremateriales/view/modulos/productos/service/product_service.dart';
import 'package:ferremateriales/view/home/widgets/product_card.dart';
import 'package:ferremateriales/view/modulos/productos/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ferremateriales/src/routes/app_routes.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/app_drawer.dart';
import '../cubit/search_product_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> allProducts = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() async {
    final products = await ProductService.getProducts();

    print("Productos cargados: ${products.length}");

    if (!mounted) return;

    setState(() {
      allProducts = products;
    });

    context.read<SearchProductCubit>().setProducts(products);
  }

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, AppRoutes.home);
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.products);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.category);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.favorite);
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.cart);
        break;
      case 5:
        Navigator.pushNamed(context, AppRoutes.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

      body: CustomScrollView(
        slivers: [
          /// APPBAR
          SliverAppBar(
            pinned: true,
            expandedHeight: 120,
            backgroundColor: const Color.fromARGB(255, 255, 106, 20),

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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 8),
                        child: Image.asset(
                          "assets/icons/icono_page.png",
                          height: 35,
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
                            context.read<SearchProductCubit>().searchProducts(value);
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

          /// BANNER
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

          /// 🔥 PRODUCTOS (AQUÍ ESTÁ LO IMPORTANTE)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<SearchProductCubit, List<ProductModel>>(
                builder: (context, filteredProducts) {
                  if (filteredProducts.isEmpty) {
                    return const Center(
                      child: Text("No se encontraron productos"),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Productos",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredProducts.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];

                          return ProductCard(
                            product: product,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProductDetail(product: product),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),

      /// MENÚ INFERIOR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Productos"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categorías"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoritos"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carrito"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
