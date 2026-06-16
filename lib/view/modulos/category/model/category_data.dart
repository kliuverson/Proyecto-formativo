import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';
import '../model/category_model.dart';

List<Category> buildCategories(AppLocalizations tr) => [

  Category(
    name: tr.categoryBathroomName,
    description: tr.categoryBathroomDesc,
    productCount: 185,
    imageUrl: 'assets/images/category/bathroom.png',
    color: const Color(0xFF2A3B4C),
  ),

  Category(
    name: tr.categoryFloorsName,
    description: tr.categoryFloorsDesc,
    productCount: 210,
    imageUrl: 'assets/images/category/floors.png',
    color: const Color(0xFF3A4A3C),
  ),

  Category(
    name: tr.categoryConstructionName,
    description: tr.categoryConstructionDesc,
    productCount: 289,
    imageUrl: 'assets/images/category/construction.jpg',
    color: const Color(0xFF4A3A3A),
  ),

  Category(
    name: tr.categoryElectricalName,
    description: tr.categoryElectricalDesc,
    productCount: 195,
    imageUrl: 'assets/images/category/electrical.jpg',
    color: const Color(0xFF3A3A4A),
  ),
];

