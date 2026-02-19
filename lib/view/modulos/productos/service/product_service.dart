import 'package:ferremateriales/view/modulos/productos/model/product.dart';
import 'package:flutter/material.dart';

class ProductService {
  static List<Product> getProducts() {
    return [
      Product(
        id: "1",
        name: "Martillo",
        price: 25.0,
        icon: Icons.build,
      ),
      Product(
        id: "2",
        name: "Taladro",
        price: 120.0,
        icon: Icons.handyman,
      ),
      Product(
        id: "3",
        name: "Destornillador",
        price: 15.0,
        icon: Icons.construction,
      ),
    ];
  }
}
