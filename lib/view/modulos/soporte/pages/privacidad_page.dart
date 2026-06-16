import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class PrivacidadPage extends StatelessWidget {
  const PrivacidadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(tr.privacyTitle)),
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
                  tr.privacyTitle,
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
            tr.privacyLastUpdate,
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
          const SizedBox(height: 20),
          _Seccion(
            titulo: tr.privacy1Title,
            contenido:
                tr.privacy1Content,
          ),
          _Seccion(
            titulo: tr.privacy2Title,
            contenido:
                tr.privacy2Content,
          ),
          _Seccion(
            titulo: tr.privacy3Title,
            contenido:
                tr.privacy3Content,
          ),
          _Seccion(
            titulo: tr.privacy4Title,
            contenido:
                tr.privacy4Content,
          ),
          _Seccion(
            titulo: tr.privacy5Title,
            contenido:
                tr.privacy5Content,
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

