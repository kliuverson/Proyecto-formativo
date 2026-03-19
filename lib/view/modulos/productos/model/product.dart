// lib/view/modulos/productos/model/product.dart
import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final IconData icon;
  final String image; // Asumo que es la URL de la imagen
  final String category; 

  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.icon,
    required this.image,
    required this.category,
    this.isFavorite = false,
  });

  // >>> ¡IMPORTANTE! Sobrescribir == y hashCode para que la lista funcione correctamente <<<
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.id == id; // Dos productos son iguales si tienen el mismo ID
  }

  @override
  int get hashCode => id.hashCode; // El hashCode se basa en el ID
}