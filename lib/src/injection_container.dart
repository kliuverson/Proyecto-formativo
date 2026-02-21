import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/module_repository.dart';
import 'models/module_model.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Inicializar Hive
  await Hive.initFlutter();
  Hive.registerAdapter(ModuleAdapter());
  final box = await Hive.openBox('modules');

  // Registrar repositorios y dependencias
  sl.registerLazySingleton<ModuleRepository>(() => ModuleRepository(box));
}
