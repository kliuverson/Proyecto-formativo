import 'package:flutter/material.dart';
import 'package:ferremateriales/src/injection_container.dart' as di;
import 'package:ferremateriales/src/data/module_repository.dart';
import 'package:ferremateriales/src/models/module_model.dart';

class ModulesDemoPage extends StatefulWidget {
  const ModulesDemoPage({super.key});

  @override
  State<ModulesDemoPage> createState() => _ModulesDemoPageState();
}

class _ModulesDemoPageState extends State<ModulesDemoPage> {
  final ModuleRepository _repo = di.sl<ModuleRepository>();
  List<ModuleModel> _modules = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final modules = await _repo.getModules();
    setState(() {
      _modules = modules;
      _loading = false;
    });
  }

  Future<void> _addDummy() async {
    final id = 'local_${DateTime.now().millisecondsSinceEpoch}';
    final module = ModuleModel(id: id, title: 'Nuevo producto', description: 'Creado localmente', price: 1.0);
    await _repo.addModule(module);
    await _load();
  }

  Future<void> _deleteModule(String id) async {
    await _repo.deleteModuleById(id);
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Módulos (demo local)')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _modules.isEmpty
              ? const Center(child: Text('No hay módulos'))
              : ListView.separated(
                  itemCount: _modules.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final m = _modules[index];
                    return Dismissible(
                      key: ValueKey(m.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) => _deleteModule(m.id),
                      child: ListTile(
                        title: Text(m.title),
                        subtitle: Text(m.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('\$${m.price.toStringAsFixed(2)}'),
                            IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (c) => AlertDialog(
                                    title: const Text('Eliminar'),
                                    content: const Text('¿Eliminar este módulo?'),
                                    actions: [
                                      TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('Cancelar')),
                                      TextButton(onPressed: () => Navigator.pop(c, true), child: const Text('Eliminar')),
                                    ],
                                  ),
                                );
                                if (confirm == true) {
                                  await _deleteModule(m.id);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDummy,
        child: const Icon(Icons.add),
      ),
    );
  }
}
