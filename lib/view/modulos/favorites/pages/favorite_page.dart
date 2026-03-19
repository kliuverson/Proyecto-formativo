// lib/view/modulos/favorites/pages/favorites_page.dart
import 'package:ferremateriales/view/modulos/favorites/service/favo_service.dart';
import 'package:ferremateriales/view/modulos/productos/pages/product_details.dart'; // Para la navegación a detalles
//import 'package:ferremateriales/view/modulos/productos/model/product.dart'; // Tu modelo Product
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // Obtenemos la única instancia del servicio.
  // Es importante no crear una nueva instancia cada vez que se reconstruye el widget.
  final FavoritesService _favoritesService = FavoritesService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Favoritos'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: AnimatedBuilder(
        animation: _favoritesService, // Escucha los cambios en FavoritesService
        builder: (context, _) {
          final favorites =
              _favoritesService.favorites; // Accede a la lista de favoritos

          // >>> DEBUGGING ADICIONAL <<<
          debugPrint(
            'FavoritesPage.AnimatedBuilder reconstruyendo. Favoritos en lista: ${favorites.length}',
          );
          if (favorites.isNotEmpty) {
            favorites.forEach(
              (p) => debugPrint(
                ' Fav: ${p.nombre}, ID: ${p.sku}',
              ),
            );
          }
          // >>> FIN DEBUGGING <<<

          if (favorites.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'No tienes productos en favoritos',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    '¡Marca el corazón en tus productos para añadirlos!',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Productos favoritos: ${favorites.length}',
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

                    // >>> DEBUGGING ADICIONAL POR CADA ITEM <<<
                    debugPrint(
                      'Construyendo ListTile para favorito: ${product.nombre}, ID: ${product.sku}',
                    );
                    // >>> FIN DEBUGGING <<<

                    return ListTile(
                      leading:
                          product.image.isNotEmpty
                              ? Image.network(
                                product.image,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (_, __, ___) => const Icon(
                                      Icons.image,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
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
    );
  }
}
