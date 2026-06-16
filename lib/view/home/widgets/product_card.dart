import 'package:ferremateriales/view/modulos/carrito/pages/model/cart_model.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/service/cart_service.dart';
import 'package:ferremateriales/view/modulos/favorites/service/favo_service.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

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
  bool isFavorite = false;
  bool isAdding = false;

  late final FavoritesService _favoritesService;

  late AnimationController _favController;
  late Animation<double> _favAnimation;

  @override
  void initState() {
    super.initState();

    _favoritesService = FavoritesService();

    isFavorite = _favoritesService.isFavorite(widget.product);
    _favoritesService.addListener(_onFavoritesChanged);

    _favController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _favAnimation = Tween<double>(
      begin: 1,
      end: 1.2,
    ).animate(
      CurvedAnimation(
        parent: _favController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _favoritesService.removeListener(_onFavoritesChanged);
    _favController.dispose();
    super.dispose();
  }

  void _onFavoritesChanged() {
    final fav = _favoritesService.isFavorite(widget.product);

    if (fav != isFavorite) {
      setState(() {
        isFavorite = fav;
      });
    }
  }

  void _toggleFavorite() {
    _favoritesService.toggleFavorite(widget.product);

    _favController.forward().then((_) {
      _favController.reverse();
    });
  }

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

    await Future.delayed(const Duration(milliseconds: 250));

    if (!mounted) return;

    setState(() {
      isAdding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    final product = widget.product;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 0.8,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              flex: 5,
              child: Stack(
                children: [

                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                    child: Image.network(
                      product.image.isNotEmpty
                          ? product.image
                          : "https://images.unsplash.com/photo-1581092334651-ddf26d9a09d0",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 8,
                    right: 8,
                    child: ScaleTransition(
                      scale: _favAnimation,
                      child: GestureDetector(
                        onTap: _toggleFavorite,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 4,
                              )
                            ],
                          ),
                          child: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorite
                                ? Colors.red
                                : Colors.grey,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      product.nombre,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "SKU: ${product.sku}",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      tr.inStock,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "\$${product.precio.toStringAsFixed(0)}",
                          style: const TextStyle(
                            color: Color(0xFFFF6A14),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),

                        AnimatedScale(
                          scale: isAdding ? .85 : 1,
                          duration:
                              const Duration(milliseconds: 150),
                          child: GestureDetector(
                            onTap: _addToCart,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF6A14),
                                borderRadius:
                                    BorderRadius.circular(8),
                              ),
                              child: Icon(
                                isAdding
                                    ? Icons.check
                                    : Icons.shopping_cart_outlined,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

