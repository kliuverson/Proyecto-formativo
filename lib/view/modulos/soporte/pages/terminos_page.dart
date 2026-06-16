import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class TerminosPage extends StatelessWidget {
  const TerminosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(tr.termsTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4B740).withOpacity(0.18),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  tr.termsTitle,
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
            tr.termsLastUpdate,
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
          const SizedBox(height: 20),
          _Seccion(
            titulo: tr.terms1Title,
            contenido:
                tr.terms1Content,
          ),
          _Seccion(
            titulo: tr.terms2Title,
            contenido:
                tr.terms2Content,
          ),
          _Seccion(
            titulo: tr.terms3Title,
            contenido:
                tr.terms3Content,
          ),
          _Seccion(
            titulo: tr.terms4Title,
            contenido:
                tr.terms4Content,
          ),
          _Seccion(
            titulo: tr.terms5Title,
            contenido:
                tr.terms5Content,
          ),
          _Seccion(
            titulo: tr.terms6Title,
            contenido:
                tr.terms6Content,
          ),
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
            style: TextStyle(fontSize: 13, color: Colors.grey[700], height: 1.6),
          ),
        ],
      ),
    );
  }
}

