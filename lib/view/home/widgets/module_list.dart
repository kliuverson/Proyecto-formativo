import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ferremateriales/src/models/module_model.dart';
import 'package:ferremateriales/src/data/module_repository.dart';
import 'package:ferremateriales/src/injection_container.dart' as di;

class ModulesList extends StatelessWidget {
  final int? limit;

  const ModulesList({super.key, this.limit});

  @override
  Widget build(BuildContext context) {
    final ModuleRepository repo = di.sl<ModuleRepository>();

    return FutureBuilder<List<ModuleModel>>(
      future: repo.getModules(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Error al cargar módulos: ${snapshot.error}'),
          );
        }

        return ValueListenableBuilder<Box>(
          valueListenable: Hive.box('modules').listenable(),
          builder: (context, box, _) {
            final modules = box.values.whereType<ModuleModel>().toList();

            if (modules.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('No hay módulos disponibles'),
              );
            }

            final display =
                limit != null ? modules.take(limit!).toList() : modules;

            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: display.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final m = display[index];

                return ListTile(
                  title: Text(m.title),
                  subtitle: Text(m.description),
                  trailing: Text('\$${m.price.toStringAsFixed(2)}'),
                );
              },
            );
          },
        );
      },
    );
  }
}