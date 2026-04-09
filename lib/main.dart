import 'package:ferremateriales/cubit/auth_cubit.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/bloc/cart_bloc.dart';
import 'package:ferremateriales/view/modulos/carrito/pages/bloc/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'view/modulos/carrito/pages/model/cart_model.dart';
import 'view/modulos/carrito/pages/service/cart_service.dart';
import 'view/modulos/productos/data/repository/product_repository.dart';
import 'view/modulos/productos/logic/bloc/product_bloc.dart';
import 'view/home/cubit/search_product_cubit.dart';
import 'utils/theme/theme.dart';
import 'view/home/page/splash_page.dart';
import 'src/routes/app_routes.dart';
import 'src/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(CartItemAdapter()); // generado por build_runner
  await CartService.init(); // carga datos guardados

  await di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SearchProductCubit()),
        BlocProvider(create: (_) => ProductBloc(ProductRepository())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
        BlocProvider(create: (_) => AuthCubit()),
      ],
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
      home: const SplashPage(),
      routes: AppRoutes.routes,
    );
  }
}