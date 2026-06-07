import 'package:ferremateriales/cubit/auth_cubit.dart';
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
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    loadProducts();
    _searchController.addListener(() {
      setState(() {
        _isSearching = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final searchBg = isDark ? Colors.grey[800]! : Colors.white;
    final searchTextColor = isDark ? Colors.white : Colors.black87;
    final hintColor = isDark ? Colors.grey[400]! : Colors.grey[500]!;
    final iconColor = isDark ? Colors.grey[300]! : Colors.grey[600]!;

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
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              },
            ),
            actions: [
              Builder(
                builder: (context) {
                  final auth = context.watch<AuthCubit>().state;
                  final isAdmin = auth.userData?["esAdmin"] ?? false;
                  if (!isAdmin) return const SizedBox();
                  return IconButton(
                    icon: const Icon(Icons.admin_panel_settings, color: Colors.black),
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.admin),
                  );
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 8),
                        child: Image.asset("assets/icons/icono_page.png", height: 35),
                      ),
                      const SizedBox(height: 10),

                      /// BUSCADOR — respeta el tema
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: searchBg,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: _searchController,
                          style: TextStyle(color: searchTextColor),
                          onChanged: (value) {
                            context.read<SearchProductCubit>().searchProducts(value);
                          },
                          decoration: InputDecoration(
                            hintText: "Buscar herramientas...",
                            hintStyle: TextStyle(color: hintColor),
                            prefixIcon: Icon(Icons.search, color: iconColor),
                            border: InputBorder.none,
                            suffixIcon: _isSearching
                                ? IconButton(
                                    icon: Icon(Icons.close, size: 18, color: iconColor),
                                    onPressed: () {
                                      _searchController.clear();
                                      context.read<SearchProductCubit>().searchProducts('');
                                    },
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /// BANNER — se oculta al buscar
          if (!_isSearching)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: BannerCarousel(),
              ),
            ),

          /// CATEGORÍAS — se oculta al buscar
          if (!_isSearching)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CategoryGrid(),
              ),
            ),

          /// PRODUCTOS
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<SearchProductCubit, SearchProductState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(40),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state.products.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            Icon(Icons.search_off, size: 48, color: Colors.grey[400]),
                            const SizedBox(height: 12),
                            Text(
                              'No se encontraron productos\npara "${_searchController.text}"',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  final display = _isSearching
                      ? state.products
                      : (state.products.length > 4
                          ? state.products.sublist(0, 4)
                          : state.products);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _isSearching
                            ? '${state.products.length} resultado(s)'
                            : 'Productos Destacados',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: display.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.55,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          final product = display[index];
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