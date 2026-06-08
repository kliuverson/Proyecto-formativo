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
  bool _searchVisible = false;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  Color get backgroundColor =>
      isDarkMode ? const Color(0xFF0A0E17) : const Color(0xFFF5F7FA);

  Color get textPrimaryColor =>
      isDarkMode ? Colors.white : const Color(0xFF1F2937);

  Color get textSecondaryColor =>
      isDarkMode ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);

  Color get accentColor => const Color(0xFFF4B740);

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void _toggleSearch() {
    setState(() {
      _searchVisible = !_searchVisible;
      if (!_searchVisible) {
        _searchQuery = '';
        _searchController.clear();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: CategoryAppBar(
        title: 'Herramientas',
        isDarkMode: isDarkMode,
        toggleTheme: toggleTheme,
        accentColor: accentColor,
        borderColor: Colors.grey,
        backgroundColor: Colors.white,
        onBack: () => Navigator.pop(context),
        onCart: () => Navigator.pushNamed(context, '/cart'),
        onSearch: _toggleSearch,
      ),

      body: Column(
        children: [
          // ✅ Barra de búsqueda animada
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _searchVisible ? 60 : 0,
            color: isDarkMode ? const Color(0xFF0A0E17) : Colors.white,
            child: _searchVisible
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: TextField(
                      controller: _searchController,
                      autofocus: true,
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Buscar categoría...',
                        hintStyle: TextStyle(
                          color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                        ),
                        filled: true,
                        fillColor: isDarkMode
                            ? const Color(0xFF1E2530)
                            : Colors.white,
                        prefixIcon: Icon(
                          Icons.search,
                          color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                          ),
                          onPressed: _toggleSearch,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: accentColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: accentColor, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 12,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() => _searchQuery = value.toLowerCase());
                      },
                    ),
                  )
                : const SizedBox.shrink(),
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
                    child: CategoryGrid(searchQuery: _searchQuery),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

