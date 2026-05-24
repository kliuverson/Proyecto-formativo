import 'package:flutter/material.dart';

import 'package:ferremateriales/view/modulos/favorites/service/favo_service.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() =>
      _ProductCardState();
}

class _ProductCardState
    extends State<ProductCard> {

  final FavoritesService favoritesService =
      FavoritesService();

  @override
  void initState() {
    super.initState();

    favoritesService.addListener(
      _onFavoritesChanged,
    );
  }

  @override
  void dispose() {
    favoritesService.removeListener(
      _onFavoritesChanged,
    );

    super.dispose();
  }

  void _onFavoritesChanged() {
    if (!mounted) return;

    setState(() {});
  }

  Future<void> _toggleFavorite() async {

    debugPrint(
      "CLICK FAVORITO: ${widget.product.nombre}",
    );

    await favoritesService.toggleFavorite(
      widget.product,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final isFavorite =
        favoritesService.isFavorite(
      widget.product,
    );

    return Card(
      elevation: 2,

      child: Stack(
        children: [

          /// CONTENIDO
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Expanded(
                child: Container(
                  width: double.infinity,

                  color: Colors.grey[300],

                  child: Center(
                    child: Icon(
                      Icons.inventory_2,
                      size: 50,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.all(8),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      widget.product.nombre,

                      style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),

                      maxLines: 1,

                      overflow:
                          TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 5),

                    Text(
                      '\$${widget.product.precio}',

                      style: const TextStyle(
                        color: Colors.green,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// BOTON FAVORITO
          Positioned(
            top: 6,
            right: 6,

            child: IconButton(
              icon: Icon(
                isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,

                color: Colors.red,
              ),

              onPressed: _toggleFavorite,
            ),
          ),
        ],
      ),
    );
  }
}