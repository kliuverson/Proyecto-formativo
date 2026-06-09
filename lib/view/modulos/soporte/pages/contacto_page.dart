
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactoPage extends StatelessWidget {
  const ContactoPage({super.key});

  Future<void> _abrirUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contacto / Soporte")),
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
                child: const Text(
                  "Contacto / Soporte",
                  style: TextStyle(
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
            "Estamos aquí para ayudarte",
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
          const SizedBox(height: 20),

          const _Seccion(
            titulo: "¿En qué podemos ayudarte?",
            contenido:
                "Nuestro equipo de soporte está disponible para resolver tus dudas sobre pedidos, productos, entregas o cualquier inconveniente que tengas con la app.",
          ),
          const _Seccion(
            titulo: "Horario de atención",
            contenido:
                "Lunes a viernes de 8:00 a.m. a 6:00 p.m.\nSábados de 8:00 a.m. a 1:00 p.m.\nDomingos y festivos: cerrado.",
          ),

          const _TituloSeccion(texto: "Canales de contacto"),
          const SizedBox(height: 12),

          _ContactoCard(
            icono: Icons.email_outlined,
            titulo: "Correo electrónico",
            subtitulo: "soporte@ferremateriales.com",
            onTap: () => _abrirUrl("mailto:soporte@ferremateriales.com"),
          ),
          _ContactoCard(
            icono: Icons.phone_outlined,
            titulo: "Teléfono / WhatsApp",
            subtitulo: "+57 310 000 0000",
            onTap: () => _abrirUrl("https://wa.me/573100000000"),
          ),
          _ContactoCard(
            icono: Icons.location_on_outlined,
            titulo: "Visítanos",
            subtitulo: "Cra. 10 #45-30, Barranquilla, Colombia",
            onTap: () => _abrirUrl(
                "https://maps.google.com/?q=Cra.+10+%2345-30+Barranquilla"),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _abrirUrl("https://wa.me/573100000000"),
              icon: const Icon(Icons.chat_outlined),
              label: const Text("Chatear por WhatsApp"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF4B740),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
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

class _TituloSeccion extends StatelessWidget {
  final String texto;
  const _TituloSeccion({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFFF4B740),
      ),
    );
  }
}

class _ContactoCard extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String subtitulo;
  final VoidCallback onTap;

  const _ContactoCard({
    required this.icono,
    required this.titulo,
    required this.subtitulo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFF4B740).withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icono, color: const Color(0xFFF4B740), size: 22),
        ),
        title: Text(
          titulo,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitulo,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}

