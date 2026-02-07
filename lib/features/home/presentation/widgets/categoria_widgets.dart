import 'package:flutter/material.dart';

class CategoriaWidget extends StatelessWidget {
  const CategoriaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
