import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final IconData icon;
  final String image;

  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.icon,
    required this.image,
    this.isFavorite = false,
  });
}