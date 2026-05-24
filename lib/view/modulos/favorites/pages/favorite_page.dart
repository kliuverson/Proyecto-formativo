import 'package:flutter/material.dart';

import 'package:ferremateriales/view/modulos/favorites/service/favo_service.dart';
import 'package:ferremateriales/view/modulos/productos/pages/product_details.dart';

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

    _favoritesService.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Favoritos"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: AnimatedBuilder(
        animation: _favoritesService,

        builder: (context, _) {
          final favorites = _favoritesService.favorites;

          debugPrint("FAVORITOS: ${favorites.length}");

          if (favorites.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.grey),

                  SizedBox(height: 20),

                  Text(
                    "No tienes productos en favoritos",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Marca el corazón para agregar favoritos",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),

                child: Text(
                  "Productos favoritos: ${favorites.length}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: favorites.length,

                  itemBuilder: (context, index) {
                    final product = favorites[index];

                    debugPrint("PRODUCTO FAVORITO: ${product.nombre}");

                    return ListTile(
                      leading:
                          product.image.isNotEmpty
                              ? Image.network(
                                product.image,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,

                                errorBuilder: (_, __, ___) {
                                  return const Icon(
                                    Icons.image,
                                    size: 40,
                                    color: Colors.grey,
                                  );
                                },
                              )
                              : const Icon(
                                Icons.image,
                                size: 40,
                                color: Colors.grey,
                              ),

                      title: Text(product.nombre),

                      subtitle: Text("\$${product.precio.toStringAsFixed(0)}"),

                      trailing: IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.red),

                        onPressed: () async {
                          await _favoritesService.toggleFavorite(product);
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
    );
  }
}
