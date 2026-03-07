import 'package:flutter/material.dart';
import '../widgets/category_appbar.dart';
import '../widgets/category_header.dart';
import '../widgets/category_grid.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  bool isDarkMode = true;

  Color get backgroundColor =>
      isDarkMode ? const Color(0xFF0A0E17) : const Color(0xFFF5F7FA);

  Color get surfaceColor =>
      isDarkMode ? const Color(0xFF141A24) : Colors.white;

  Color get textPrimaryColor =>
      isDarkMode ? Colors.white : const Color(0xFF1F2937);

  Color get textSecondaryColor =>
      isDarkMode ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);

  Color get borderColor =>
      isDarkMode ? const Color(0xFF2A2F3A) : const Color(0xFFE5E7EB);

  Color get accentColor => const Color(0xFFF4B740);

  void toggleTheme(){
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [

            CategoryAppBar(
              isDarkMode: isDarkMode,
              toggleTheme: toggleTheme,
              accentColor: accentColor,
              borderColor: borderColor,
              backgroundColor: backgroundColor,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    CategoryHeader(
                      accentColor: accentColor,
                      textPrimaryColor: textPrimaryColor,
                      textSecondaryColor: textSecondaryColor,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CategoryGrid(
                        accentColor: accentColor,
                        surfaceColor: surfaceColor,
                        borderColor: borderColor,
                        textPrimaryColor: textPrimaryColor,
                        textSecondaryColor: textSecondaryColor,
                      ),
                    )

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}