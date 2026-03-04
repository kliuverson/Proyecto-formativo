// lib/view/modulos/category/pages/category_page.dart

import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool _isDarkMode = true; // Control de tema (true = oscuro, false = claro)
  
  // Colores dinámicos según el tema
  Color get backgroundColor => _isDarkMode ? const Color(0xFF0A0E17) : const Color(0xFFF5F7FA);
  Color get surfaceColor => _isDarkMode ? const Color(0xFF141A24) : Colors.white;
  Color get textPrimaryColor => _isDarkMode ? Colors.white : const Color(0xFF1F2937);
  Color get textSecondaryColor => _isDarkMode ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);
  Color get borderColor => _isDarkMode ? const Color(0xFF2A2F3A) : const Color(0xFFE5E7EB);
  Color get accentColor => const Color(0xFFF4B740); // Naranja se mantiene igual
  Color get cardShadowColor => _isDarkMode ? Colors.black.withOpacity(0.3) : Colors.grey.withOpacity(0.1);

  // Lista de categorías con imágenes
  final List<Map<String, dynamic>> categories = const [
    {
      'name': 'Baños',
      'description': 'Griferia, regaderas, accesorios y más',
      'productCount': 185,
      'imageUrl': 'assets/images/categorias/bathroom.jpg',
      'color': Color(0xFF2A3B4C),
    },
    {
      'name': 'Pisos',
      'description': 'Cerámicos, porcelanatos y madera',
      'productCount': 210,
      'imageUrl': 'assets/images/categorias/floors.jpg',
      'color': Color(0xFF3A4A3C),
    },
    {
      'name': 'Construcción',
      'description': 'Cemento, varilla, block y materiales básicos',
      'productCount': 289,
      'imageUrl': 'assets/images/categorias/construction.jpg',
      'color': Color(0xFF4A3A3A),
    },
    {
      'name': 'Electricidad',
      'description': 'Cables, interruptores, contactos y más',
      'productCount': 195,
      'imageUrl': 'assets/images/categorias/electrical.jpg',
      'color': Color(0xFF3A3A4A),
    },
    {
      'name': 'Pintura',
      'description': 'Pinturas, brochas, rodillos y solventes',
      'productCount': 156,
      'imageUrl': 'assets/images/categorias/paint.jpg',
      'color': Color(0xFF4A3A4A),
    },
    {
      'name': 'Jardín',
      'description': 'Herramientas de jardín, mangueras y riego',
      'productCount': 124,
      'imageUrl': 'assets/images/categorias/garden.jpg',
      'color': Color(0xFF2A4A3A),
    },
  ];

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Barra superior con logo centrado, home, theme toggle y carrito
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border(
                  bottom: BorderSide(
                    color: borderColor,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botón de home a la izquierda
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: accentColor,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  
                  // Logo centrado
                  Container(
                    height: 45,
                    child: Image.asset(
                      'assets/icons/logo_recortado.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'FERRE',
                              style: TextStyle(
                                color: accentColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  
                  // Iconos de tema y carrito
                  Row(
                    children: [
                      // Botón de cambio de tema
                      IconButton(
                        icon: Icon(
                          _isDarkMode ? Icons.light_mode : Icons.dark_mode,
                          color: accentColor,
                          size: 24,
                        ),
                        onPressed: _toggleTheme,
                      ),
                      
                      // Carrito
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: accentColor,
                              size: 28,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/carrito');
                            },
                          ),
                          // Badge para cantidad
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: const Text(
                                '3',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Contenido principal
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sección de catálogo 2026
                    Container(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Etiqueta Catálogo 2026
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: accentColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: accentColor.withOpacity(0.3),
                              ),
                            ),
                            child: Text(
                              'CATÁLOGO 2026',
                              style: TextStyle(
                                color: accentColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Texto combinado
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'ENCUENTRA TODO LO\n',
                                  style: TextStyle(
                                    color: textPrimaryColor,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    height: 1.1,
                                  ),
                                ),
                                TextSpan(
                                  text: 'QUE NECESITAS',
                                  style: TextStyle(
                                    color: accentColor,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 16),
                          
                          // Descripción
                          Text(
                            'Explora nuestras categorías y encuentra las mejores herramientas, materiales y accesorios para tu proyecto.',
                            style: TextStyle(
                              color: textSecondaryColor,
                              fontSize: 15,
                              height: 1.5,
                            ),
                          ),
                          
                          const SizedBox(height: 24),
                          
                          // Botón Ver Categorías
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: accentColor,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                    color: accentColor.withOpacity(0.3),
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Ver Categorías',
                                    style: TextStyle(
                                      color: Color(0xFF0A0E17),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xFF0A0E17),
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Separador decorativo
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              accentColor.withOpacity(0.5),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Título "NUESTRAS CATEGORÍAS"
                    Container(
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NUESTRAS CATEGORÍAS',
                            style: TextStyle(
                              color: textPrimaryColor,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 60,
                            height: 4,
                            decoration: BoxDecoration(
                              color: accentColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Explora nuestra amplia selección de productos organizados para ti',
                            style: TextStyle(
                              color: textSecondaryColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Grid de categorías
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return _buildProfessionalCategoryCard(category);
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Footer
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _isDarkMode ? const Color(0xFF05080F) : const Color(0xFFF0F2F5),
                        border: Border(
                          top: BorderSide(
                            color: accentColor.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Text(
                        '© 2026 Ferretería — Todos los derechos reservados',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textSecondaryColor,
                          fontSize: 13,
                          letterSpacing: 0.5,
                        ),
                      ),
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

  // Tarjeta de categoría con diseño adaptable al tema
  Widget _buildProfessionalCategoryCard(Map<String, dynamic> category) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: cardShadowColor,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Área de imagen con overlay
            Expanded(
              flex: 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Imagen de fondo
                  Container(
                    color: category['color'],
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        color: Colors.white24,
                        size: 40,
                      ),
                    ),
                  ),
                  
                  // Overlay con gradiente (se adapta al tema)
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          (_isDarkMode ? const Color(0xFF141A24) : Colors.white).withOpacity(0.9),
                        ],
                      ),
                    ),
                  ),
                  
                  // Nombre de categoría
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Text(
                      category['name'],
                      style: TextStyle(
                        color: textPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Contenido inferior
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Descripción
                    Text(
                      category['description'],
                      style: TextStyle(
                        color: textSecondaryColor,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Contador y botón
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Contador de productos
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: accentColor.withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            '${category['productCount']}',
                            style: TextStyle(
                              color: accentColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        
                        // Botón de ver productos
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: accentColor.withOpacity(0.3),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: accentColor,
                            size: 18,
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