import 'package:flutter/material.dart';

class Category {

  final String name;
  final String description;
  final int productCount;
  final String imageUrl;
  final Color color;
  final String dbKey;

  Category({
    required this.name,
    required this.description,
    required this.productCount,
    required this.imageUrl,
    required this.color,
    required this.dbKey,
  });

}

