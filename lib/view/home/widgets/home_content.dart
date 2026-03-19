import 'package:ferremateriales/view/home/widgets/module_list.dart';
import 'package:ferremateriales/view/modulos/category/widgets/category_grid.dart';
import 'package:flutter/material.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/buscador.dart';



class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Buscador(),
          const SizedBox(height: 20),
          const BannerCarousel(),
          const SizedBox(height: 24),
          // 🔹 Aquí van tus categorías con los iconos originales
          const CategoryGrid(
          
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 12),
          const Text(
            'Módulos locales',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const ModulesList(limit: 3),
        ],
      ),
    );
  }
}