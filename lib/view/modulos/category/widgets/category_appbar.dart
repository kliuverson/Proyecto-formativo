import 'package:flutter/material.dart';

class CategoryAppBar extends StatelessWidget {

  final bool isDarkMode;
  final VoidCallback toggleTheme;
  final Color accentColor;
  final Color borderColor;
  final Color backgroundColor;

  const CategoryAppBar({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    required this.accentColor,
    required this.borderColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(color: borderColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          IconButton(
            icon: Icon(Icons.home, color: accentColor),
            onPressed: (){
              Navigator.pushNamed(context, '/home');
            },
          ),

          Image.asset(
            'assets/icons/logo_recortado.png',
            height: 40,
          ),

          Row(
            children: [

              IconButton(
                icon: Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: accentColor,
                ),
                onPressed: toggleTheme,
              ),

              IconButton(
                icon: Icon(Icons.shopping_cart_outlined, color: accentColor),
                onPressed: (){
                  Navigator.pushNamed(context, '/carrito');
                },
              ),

            ],
          )
        ],
      ),
    );
  }
}