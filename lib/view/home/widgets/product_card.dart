import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:ferremateriales/view/modulos/favorites/service/favo_service.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/service/cart_service.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/model/cart_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  bool isAdding = false;

  late final FavoritesService _favoritesService;

  late AnimationController _favController;
  late Animation<double> _favAnimation;

  @override
  void initState() {
    super.initState();

    _favoritesService = FavoritesService();

    debugPrint(
      'ProductCard init: ${widget.product.nombre}',
    );

    _favController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _favAnimation = Tween<double>(
      begin: 1,
      end: 1.25,
    ).animate(
      CurvedAnimation(
        parent: _favController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _favController.dispose();
    super.dispose();
  }

  // =========================
  // FAVORITOS
  // =========================
  void _toggleFavorite() async {
    debugPrint(
      "CLICK FAVORITE HANDLER: ${widget.product.nombre} (${widget.product.id})",
    );

    await _favoritesService.toggleFavorite(widget.product);

    setState(() {});

    // ANIMACION
    _favController.forward().then((_) {
      _favController.reverse();
    });
  }

  // =========================
  // CARRITO
  // =========================
  void _addToCart() async {
    setState(() {
      isAdding = true;
    });

    final item = CartItem(
      id: widget.product.sku,
      name: widget.product.nombre,
      quantity: 1,
      price: widget.product.precio,
    );

    CartService.addProduct(item);

    await Future.delayed(const Duration(milliseconds: 200));

    setState(() {
      isAdding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    // FAVORITO DINÁMICO
    final isFavorite =
        _favoritesService.isFavorite(widget.product);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Stack(
        children: [
          // =========================
          // ZONA PRINCIPAL
          // =========================
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: widget.onTap,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // IMAGEN
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),

                  child: Image.network(
                    product.image.isNotEmpty
                        ? product.image
                        : "https://images.unsplash.com/photo-1581092334651-ddf26d9a09d0",

                    height: 110,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        product.nombre,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // =========================
                      // PRECIO + CARRITO
                      // =========================
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            "\$${product.precio.toStringAsFixed(0)}",

                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                            ),
                          ),

                          AnimatedScale(
                            scale: isAdding ? 0.85 : 1,
                            duration: const Duration(milliseconds: 150),

                            child: GestureDetector(
                              onTap: _addToCart,

                              child: Container(
                                padding: const EdgeInsets.all(8),

                                decoration: BoxDecoration(
                                  color: isAdding
                                      ? Colors.green
                                      : Colors.blue,

                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),

                                child: Icon(
                                  isAdding
                                      ? Icons.check
                                      : Icons.shopping_cart_outlined,

                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // =========================
          // FAVORITO
          // =========================
          Positioned(
            top: 8,
            right: 8,

            child: ScaleTransition(
              scale: _favAnimation,

              child: Container(
                padding: const EdgeInsets.all(6),

                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 6,
                    ),
                  ],
                ),

                child: IconButton(
                  onPressed: _toggleFavorite,

                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,

                    color:
                        isFavorite ? Colors.red : Colors.grey,

                    size: 18,
                  ),

                  splashRadius: 20,
                  padding: const EdgeInsets.all(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}