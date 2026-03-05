import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Product product;
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

  late AnimationController _favController;
  late Animation<double> _favAnimation;

  @override
  void initState() {
    super.initState();

    _favController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _favAnimation = Tween<double>(begin: 1, end: 1.25).animate(
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

  void _toggleFavorite() {
    setState(() => isFavorite = !isFavorite);

    _favController.forward().then((_) {
      _favController.reverse();
    });
  }

  void _addToCart() async {
    setState(() => isAdding = true);

    await Future.delayed(const Duration(milliseconds: 200));

    setState(() => isAdding = false);
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 IMAGEN
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.network(
                    product.image,
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
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),

                      /// 🔹 PRECIO + CARRITO EN FILA
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${product.price.toStringAsFixed(0)}",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                            ),
                          ),

                          AnimatedScale(
                            scale: isAdding ? 0.85 : 1,
                            duration:
                                const Duration(milliseconds: 150),
                            child: GestureDetector(
                              onTap: _addToCart,
                              child: Container(
                                padding:
                                    const EdgeInsets.all(8),
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

            /// ❤️ FAVORITO
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
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:
                          isFavorite ? Colors.red : Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}