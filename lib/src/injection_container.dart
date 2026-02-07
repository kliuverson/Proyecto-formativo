import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Registrar dependencias aquí (datasources, repos, usecases, blocs)
  // Ejemplo:
  // sl.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceImpl(client: http.Client()));
}
