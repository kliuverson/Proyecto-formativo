import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class CentroAyudaPage extends StatefulWidget {
  const CentroAyudaPage({super.key});

  @override
  State<CentroAyudaPage> createState() => _CentroAyudaPageState();
}

class _CentroAyudaPageState extends State<CentroAyudaPage> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    final List<Map<String, String>> faqs = [
      {
        "pregunta": tr.faq1Q,
        "respuesta": tr.faq1A,
      },
      {
        "pregunta": tr.faq2Q,
        "respuesta": tr.faq2A,
      },
      {
        "pregunta": tr.faq3Q,
        "respuesta": tr.faq3A,
      },
      {
        "pregunta": tr.faq4Q,
        "respuesta": tr.faq4A,
      },
      {
        "pregunta": tr.faq5Q,
        "respuesta": tr.faq5A,
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text(tr.helpCenterTitle)),
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
                  tr.faqLabel,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF4B740),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            tr.faqSubtitle,
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
          const SizedBox(height: 16),
          ...List.generate(faqs.length, (i) {
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
                              faqs[i]["pregunta"]!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFF4B740),
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
                          faqs[i]["respuesta"]!,
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

