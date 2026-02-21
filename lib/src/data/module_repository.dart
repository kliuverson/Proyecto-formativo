import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import '../models/module_model.dart';

class ModuleRepository {
  final Box _box;

  ModuleRepository(this._box);

  Future<List<ModuleModel>> getModules() async {
    final List<ModuleModel> saved = [];
    for (var i = 0; i < _box.length; i++) {
      final value = _box.getAt(i);
      if (value is ModuleModel) saved.add(value);
    }

    if (saved.isNotEmpty) return saved;

    // Fallback: load from assets
    final jsonStr = await rootBundle.loadString('assets/data/sample_modules.json');
    final List<dynamic> data = json.decode(jsonStr) as List<dynamic>;
    final modules = data.map((e) => ModuleModel.fromJson(e as Map<String, dynamic>)).toList();

    // persist to box
    for (final m in modules) {
      await _box.add(m);
    }

    return modules;
  }

  Future<void> addModule(ModuleModel module) async {
    await _box.add(module);
  }

  Future<void> deleteModuleById(String id) async {
    for (var i = 0; i < _box.length; i++) {
      final value = _box.getAt(i);
      if (value is ModuleModel && value.id == id) {
        await _box.deleteAt(i);
        return;
      }
    }
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
