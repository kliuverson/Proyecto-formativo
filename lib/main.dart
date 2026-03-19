import 'package:ferremateriales/view/home/cubit/search_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ferremateriales/src/injection_container.dart' as di;
import 'package:ferremateriales/utils/theme/theme.dart';
import 'package:ferremateriales/view/home/page/splash_page.dart';
import 'package:ferremateriales/src/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => SearchProductCubit())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ferremateriales DGC',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightAppTheme,
      darkTheme: TAppTheme.darkAppTheme,

      // pantalla inicial
      home: const SplashPage(),

      // rutas centralizadas
      routes: AppRoutes.routes,
    );
  }
}
