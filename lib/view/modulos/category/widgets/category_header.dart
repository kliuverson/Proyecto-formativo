import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class CategoryHeader extends StatelessWidget {

  final Color accentColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;

  const CategoryHeader({
    super.key,
    required this.accentColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tr.catalogYear,
              style: TextStyle(
                color: accentColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            tr.categoryHeaderTitle,
            style: TextStyle(
              color: textPrimaryColor,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            tr.categoryHeaderSubtitle,
            style: TextStyle(
              color: accentColor,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            tr.categoryHeaderDesc,
            style: TextStyle(
              color: textSecondaryColor,
              fontSize: 15,
            ),
          ),

        ],
      ),
    );
  }
}

