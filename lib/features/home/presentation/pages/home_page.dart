import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  centerTitle: true,
  title: const Text('Ferremateriales DXG'),
  leading: IconButton(
    icon: const Icon(Icons.menu),
    onPressed: () {},
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.person),
      onPressed: () {},
    ),
  ],
),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Buscador
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar productos',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Categorías
            const Text(
              'Categorías',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  Chip(label: Text('Cemento')),
                  SizedBox(width: 8),
                  Chip(label: Text('Herramientas')),
                  SizedBox(width: 8),
                  Chip(label: Text('Pinturas')),
                  SizedBox(width: 8),
                  Chip(label: Text('Electricidad')),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Productos destacados
            const Text(
              'Productos destacados',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.75,
              children: const [
                _ProductoCard(nombre: 'Cemento', precio: '\$25.000'),
                _ProductoCard(nombre: 'Martillo', precio: '\$15.000'),
                _ProductoCard(nombre: 'Taladro', precio: '\$120.000'),
                _ProductoCard(nombre: 'Pintura', precio: '\$45.000'),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

// Card 
class _ProductoCard extends StatelessWidget {
  final String nombre;
  final String precio;

  const _ProductoCard({
    required this.nombre,
    required this.precio,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.image, size: 60, color: Colors.grey),
          const SizedBox(height: 10),
          Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(precio),
        ],
      ),
    );
  }
}
