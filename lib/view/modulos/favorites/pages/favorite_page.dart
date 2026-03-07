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
          final favorites = _favoritesService.favorites; // Accede a la lista de favoritos

          // >>> DEBUGGING ADICIONAL <<<
          debugPrint('FavoritesPage.AnimatedBuilder reconstruyendo. Favoritos en lista: ${favorites.length}');
          if (favorites.isNotEmpty) {
            favorites.forEach((p) => debugPrint(' Fav: ${p.name}, ID: ${p.id}, isFavorite: ${p.isFavorite}'));
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
                    debugPrint('Construyendo ListTile para favorito: ${product.name}, ID: ${product.id}, isFavorite: ${product.isFavorite}');
                    // >>> FIN DEBUGGING <<<

                    return ListTile(
                      // Usando product.image como leading
                      leading: product.image != null && product.image.isNotEmpty
                         ? Image.network(
                              product.image,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(product.icon, size: 40, color: Colors.grey), // Fallback a IconData si la imagen falla
                            )
                          : Icon(product.icon, size: 40, color: Colors.grey), // Si no hay URL de imagen, usa el icono
                      
                      title: Text(product.name),
                      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: Icon(
                          // Usamos product.isFavorite, que debería estar actualizado por toggleFavorite
                          product.isFavorite? Icons.favorite : Icons.favorite_border,
                          color: product.isFavorite? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          // Al presionar el corazón en la lista de favoritos, lo quita
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