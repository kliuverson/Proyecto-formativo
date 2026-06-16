import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class AcercaDeNosotrosPage extends StatelessWidget {
  const AcercaDeNosotrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(tr.aboutTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4B740).withOpacity(0.18),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  tr.aboutTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF4B740),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            tr.aboutSince,
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
          const SizedBox(height: 20),
          _Seccion(
            titulo: "¿Quiénes somos?",
            contenido: tr.aboutWhoWeAreContent,
          ),
          _Seccion(titulo: "Nuestra misión", contenido: tr.aboutMissionContent),
          _Seccion(titulo: "Nuestra visión", contenido: tr.aboutVisionContent),
          _Seccion(
            titulo: "Nuestros valores",
            contenido: tr.aboutValuesContent,
          ),
          _Seccion(
            titulo: "¿Por qué elegirnos?",
            contenido: tr.aboutWhyUsContent,
          ),
          _Seccion(titulo: "Contáctanos", contenido: tr.aboutContactContent),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _Seccion extends StatelessWidget {
  final String titulo;
  final String contenido;

  const _Seccion({required this.titulo, required this.contenido});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF4B740),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            contenido,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[700],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
