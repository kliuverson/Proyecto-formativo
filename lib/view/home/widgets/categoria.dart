import 'package:flutter/material.dart';

class Categoria extends StatefulWidget {
  const Categoria({Key? key}) : super(key: key);

  @override
  State<Categoria> createState() => _CategoriaState();
}

class _CategoriaState extends State<Categoria> {
  final List<String> categorias = ['Todos', 'Herramientas ','Baños, Cocinas y Aseos', 'Pisos, Pinturas y Terminaciones','Contrucciones y Plomerias'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(categorias[index]),
              selected: selectedIndex == index,
              onSelected: (selected) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
