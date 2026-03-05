import 'package:flutter/material.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:ferremateriales/view/modulos/favorites/service/favo_service.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final FavoritesService _favoritesService = FavoritesService();

  void _onFavoritesChanged() {
    if (!mounted) return;
    setState(() {}); // Provoca una reconstrucción del widget para actualizar el icono del favorito
  }

  @override
  void initState() {
    super.initState();
    _favoritesService.addListener(_onFavoritesChanged);
  }

  @override
  void dispose() {
    _favoritesService.removeListener(_onFavoritesChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // La variable isFavorite no se usa directamente en el Icon, pero es un buen cálculo previo
    // final bool isFavorite = _favoritesService.isFavorite(widget.product); // Puedes eliminar esta línea si no la usas

    return InkWell(
      onTap: widget.onTap,
      child: Card(
        // Añadí un BorderRadius para que la Card sea redondeada como en el diseño de referencia
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias, // Para que el contenido se recorte con el borde redondeado
        elevation: 2, // Una pequeña sombra para destacarla
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    // Puedes usar product.image para mostrar una imagen real
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // Color de fondo si no hay imagen
                      image: DecorationImage( // Usar product.image
                        image: NetworkImage(widget.product.image),
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) {
                           // Fallback si la imagen no carga
                        },
                      ),
                    ),
                    child: Center(
                      // Icono de fallback si no usas imagen o si falla la carga
                      child: widget.product.image.isEmpty // Puedes verificar si la URL está vacía
                         ? Icon(widget.product.icon, size: 50, color: Colors.grey[600])
                          : const SizedBox.shrink(), // No mostrar icono si hay imagen
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '\$${widget.product.price.toStringAsFixed(2)}', // Formato de 2 decimales
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  // >>> ¡ACCEDEMOS A product A TRAVÉS DE widget.product! <<<
                  _favoritesService.isFavorite(widget.product)? Icons.favorite : Icons.favorite_border,
                  color: _favoritesService.isFavorite(widget.product)? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  // >>> ¡ACCEDEMOS A product A TRAVÉS DE widget.product! <<<
                  debugPrint('>>> BOTÓN FAVORITO PRESIONADO para: ${widget.product.name}');
                  _favoritesService.toggleFavorite(widget.product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}