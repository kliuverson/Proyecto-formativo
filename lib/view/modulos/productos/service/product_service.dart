import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:flutter/material.dart';
import 'package:ferremateriales/src/injection_container.dart' as di;
import 'package:ferremateriales/src/data/module_repository.dart';
import 'package:ferremateriales/src/models/module_model.dart';

class ProductService {
  /// Obtiene productos mapeando los módulos locales a `Product`.
  static Future<List<Product>> getProducts() async {
    final ModuleRepository repo = di.sl<ModuleRepository>();
    final List<ModuleModel> modules = await repo.getModules();

    return modules
        .map((m) => Product(
              id: m.id,
              name: m.title,
              price: m.price,
              icon: Icons.store,
                image: 'https://via.placeholder.com/400x300.png?text=${Uri.encodeComponent(m.title)}',
            ))
        .toList();
  }

  /// Fallback estático (por si se necesita synchronous). No usado por defecto.
  static List<Product> getStaticProducts() {
    return [
      Product(id: "1", name: "Martillo", price: 25.0, icon: Icons.build, image: 'https://via.placeholder.com/400x300.png?text=Martillo'),
      Product(id: "2", name: "Taladro", price: 120.0, icon: Icons.handyman, image: 'https://via.placeholder.com/400x300.png?text=Taladro'),
      Product(id: "3", name: "Destornillador", price: 15.0, icon: Icons.construction, image: 'https://via.placeholder.com/400x300.png?text=Destornillador'),
    ];
  }
}
