import 'package:ferremateriales/view/modulos/profile/cubit/profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileFailureView extends StatelessWidget {
  final String text;
  final VoidCallback onRetry;

  const ProfileFailureView({super.key, required this.text, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.exclamationmark_circle,
              size: 60,
              color: Colors.orange,
            ),

            const SizedBox(height: 16),

            Text(
              "Error al cargar el perfil",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 8),

            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onRetry,
                child: const Text("Reintentar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
