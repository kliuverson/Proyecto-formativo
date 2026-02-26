import 'package:ferremateriales/view/modulos/favorites/service/favo_service.dart';
import 'package:ferremateriales/view/modulos/productos/pages/product_details.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final FavoritesService _favoritesService = FavoritesService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Favoritos')),
      body: AnimatedBuilder(
        animation: _favoritesService,
        builder: (context, _) {
          final favorites = List.from(_favoritesService.favorites);

          try {
            print(
              'FavoritesPage rebuild -> favorites count: ${favorites.length}',
            );
          } catch (_) {}

          if (favorites.isEmpty) {
            return const Center(
              child: Text(
                'No tienes productos en favoritos',
                style: TextStyle(fontSize: 15),
              ),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Favoritos: ${favorites.length}'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final product = favorites[index];

                    try {
                      print(
                        'FavoritesPage.item -> id:${product.id} name:${product.name} price:${product.price} isFavorite:${product.isFavorite}',
                      );
                    } catch (_) {}

                    return ListTile(
                      leading: Icon(product.icon, size: 40),
                      title: Text(product.name),
                      subtitle: Text('\$${product.price}'),
                      trailing: IconButton(
                        icon: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: product.isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          _favoritesService.toggleFavorite(product);
                        },
                      ),
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
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/cart');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
        ],
      ),
    );
  }
}
