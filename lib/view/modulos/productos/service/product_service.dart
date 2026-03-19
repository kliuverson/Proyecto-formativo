import 'package:flutter/material.dart';
import 'package:ferremateriales/src/injection_container.dart' as di;
import 'package:ferremateriales/src/data/module_repository.dart';
import 'package:ferremateriales/src/models/module_model.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';

class ProductService {

  /// Obtener productos desde módulos registrados
  static Future<List<Product>> getProducts() async {

    final ModuleRepository repo = di.sl<ModuleRepository>();
    final List<ModuleModel> modules = await repo.getModules();

    return modules.map((m) {
      return Product(
        id: m.id,
        name: m.title,
        price: m.price,
        icon: Icons.store,
        image:
            'https://via.placeholder.com/400x300.png?text=${Uri.encodeComponent(m.title)}',

        /// Categoría por defecto (puedes mejorar esto luego)
        category: "General",
      );
    }).toList();
  }

  /// Productos estáticos (fallback)
  static List<Product> getStaticProducts() {
    return [

      Product(
        id: "1",
        name: "Martillo",
        price: 25.0,
        icon: Icons.build,
        image:
            'https://via.placeholder.com/400x300.png?text=Martillo',
        category: "Herramientas",
      ),

      Product(
        id: "2",
        name: "Taladro",
        price: 120.0,
        icon: Icons.handyman,
        image:
            'https://via.placeholder.com/400x300.png?text=Taladro',
        category: "Herramientas",
      ),

      Product(
        id: "3",
        name: "Destornillador",
        price: 15.0,
        icon: Icons.construction,
        image:
            'https://via.placeholder.com/400x300.png?text=Destornillador',
        category: "Herramientas",
      ),

      Product(
        id: "4",
        name: "Cemento",
        price: 35.0,
        icon: Icons.foundation,
        image:
            'https://via.placeholder.com/400x300.png?text=Cemento',
        category: "Construcción",
      ),

      Product(
        id: "5",
        name: "Arena",
        price: 10.0,
        icon: Icons.landscape,
        image:
            'https://via.placeholder.com/400x300.png?text=Arena',
        category: "Construcción",
      ),

      Product(
        id: "6",
        name: "Llave Inglesa",
        price: 40.0,
        icon: Icons.build_circle,
        image:
            'https://via.placeholder.com/400x300.png?text=Llave+Inglesa',
        category: "Herramientas",
      ),
    ];
  }

  /// Filtrar productos por categoría
  static List<Product> getProductsByCategory(String category) {

    final products = getStaticProducts();

    return products.where((product) {
      return product.category == category;
    }).toList();
  }
}
