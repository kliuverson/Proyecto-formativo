import 'package:flutter/material.dart';
import '../model/category_model.dart';

final List<Category> categories = [

  Category(
    name: 'Baños',
    description: 'Griferia, regaderas, accesorios y más',
    productCount: 185,
    imageUrl: 'assets/images/categorias/bathroom.jpg',
    color: const Color(0xFF2A3B4C),
  ),

  Category(
    name: 'Pisos',
    description: 'Cerámicos, porcelanatos y madera',
    productCount: 210,
    imageUrl: 'assets/images/categorias/floors.jpg',
    color: const Color(0xFF3A4A3C),
  ),

  Category(
    name: 'Construcción',
    description: 'Cemento, varilla y materiales básicos',
    productCount: 289,
    imageUrl: 'assets/images/categorias/construction.jpg',
    color: const Color(0xFF4A3A3A),
  ),

  Category(
    name: 'Electricidad',
    description: 'Cables, interruptores y más',
    productCount: 195,
    imageUrl: 'assets/images/categorias/electrical.jpg',
    color: const Color(0xFF3A3A4A),
  ),
];