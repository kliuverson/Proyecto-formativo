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
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Favoritos',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // Sin backgroundColor fijo — usa el tema (transparente)
        foregroundColor: isDark ? Colors.white : Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      body: AnimatedBuilder(
        animation: _favoritesService,
        builder: (context, _) {
          final favorites = _favoritesService.favorites;

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
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4B740).withOpacity(0.18),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Productos favoritos: ${favorites.length}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF4B740),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.68,
                  ),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final product = favorites[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetail(product: product),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 2,
                        // Sin color fijo — usa el color de Card del tema
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: product.image.isNotEmpty
                                      ? Image.network(
                                          product.image,
                                          height: 140,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, __, ___) =>
                                              SizedBox(
                                            height: 140,
                                            child: Center(
                                              child: Icon(
                                                Icons.image,
                                                size: 50,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(
                                          height: 140,
                                          child: Center(
                                            child: Icon(
                                              Icons.image,
                                              size: 50,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: () =>
                                        _favoritesService.toggleFavorite(product),
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundColor: isDark
                                          ? Colors.grey.shade800
                                          : Colors.white,
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.nombre,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'SKU: ${product.sku}',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    'En stock',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '\$${product.precio.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                      color: Color(0xFFF4B740),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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

