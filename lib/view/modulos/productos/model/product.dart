import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final IconData icon;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.icon,
  });
}
