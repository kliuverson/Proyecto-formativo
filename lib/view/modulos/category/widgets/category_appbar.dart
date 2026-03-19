import 'package:flutter/material.dart';

class CategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;
  final Color accentColor;
  final Color borderColor;
  final Color backgroundColor;
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onCart;
  final VoidCallback? onSearch;

  const CategoryAppBar({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    required this.accentColor,
    required this.borderColor,
    required this.backgroundColor,
    required this.title,
    this.onBack,
    this.onCart,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: onBack != null
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: accentColor),
              onPressed: onBack,
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: accentColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: accentColor),
          onPressed: onSearch,
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart, color: accentColor),
          onPressed: onCart,
        ),
      
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: borderColor,
          height: 1,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
