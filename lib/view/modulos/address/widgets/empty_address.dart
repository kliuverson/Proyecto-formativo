import 'package:flutter/material.dart';
import 'package:ferremateriales/translations/app_localizations.dart';

class EmptyAddress extends StatelessWidget {
  const EmptyAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_off,
            size: 90,
            color: Colors.grey,
          ),
          SizedBox(height: 15),
          Text(
            tr.noAddresses,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

