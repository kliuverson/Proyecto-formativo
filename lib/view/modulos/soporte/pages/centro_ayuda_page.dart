import 'package:flutter/material.dart';

class CentroAyudaPage extends StatefulWidget {
  const CentroAyudaPage({super.key});

  @override
  State<CentroAyudaPage> createState() => _CentroAyudaPageState();
}

class _CentroAyudaPageState extends State<CentroAyudaPage> {
  final List<Map<String, String>> _faqs = [
    {
      "pregunta": "¿Cómo realizo un pedido?",
      "respuesta": "Agrega productos al carrito y sigue los pasos de pago desde la sección Carrito.",
    },
    {
      "pregunta": "¿Cuáles son los métodos de pago?",
      "respuesta": "Aceptamos tarjeta débito, crédito y transferencia bancaria.",
    },
    {
      "pregunta": "¿Cuánto tarda el envío?",
      "respuesta": "El envío estándar tarda entre 2 y 5 días hábiles según tu ubicación.",
    },
    {
      "pregunta": "¿Puedo cancelar un pedido?",
      "respuesta": "Sí, puedes cancelar un pedido antes de que sea despachado desde la sección Pedidos.",
    },
    {
      "pregunta": "¿Cómo contacto al soporte?",
      "respuesta": "Puedes escribirnos a soporte@ferremateriales.com o llamar al 300 123 4567.",
    },
  ];

  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Centro de ayuda")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Preguntas frecuentes",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            "Encuentra respuestas a las dudas más comunes",
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
          const SizedBox(height: 16),
          ...List.generate(_faqs.length, (i) {
            final isOpen = _expandedIndex == i;
            return Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => setState(() {
                  _expandedIndex = isOpen ? null : i;
                }),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _faqs[i]["pregunta"]!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            isOpen
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.grey[500],
                          ),
                        ],
                      ),
                      if (isOpen) ...[
                        const SizedBox(height: 10),
                        Text(
                          _faqs[i]["respuesta"]!,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}