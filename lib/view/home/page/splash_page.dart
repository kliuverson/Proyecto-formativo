import 'package:ferremateriales/cubit/auth_cubit.dart';
import 'package:ferremateriales/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _logoScale;
  late Animation<double> _logoMove;
  late Animation<double> _textSlide;
  late Animation<double> _textOpacity;

  static const double logoSize = 90;
  static const double textSize = 150;
  static const double spacing = -2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    _logoScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.35, curve: Curves.elasticOut),
      ),
    );

    _logoMove = Tween<double>(begin: 0, end: -(textSize / 2)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 1.0, curve: Curves.easeOut),
      ),
    );

    _textSlide =
        Tween<double>(begin: 0, end: (logoSize / 2) + spacing).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.45, 1.0, curve: Curves.easeOut),
      ),
    );

    _textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.45, 1.0),
      ),
    );

    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().checkAuthStatus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _image(String path, double size) {
    return SizedBox.square(
      dimension: size,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Image.asset(path),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Theme.of(context).brightness == Brightness.dark;

    final totalWidth = logoSize + textSize;

    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.isLoading != current.isLoading,
      listener: (context, state) {
        if (!state.isLoading) {

          // En Web no redirige automáticamente.
          if (kIsWeb) {
            return;
          }

          if (state.isAuthenticated) {
            final bool esAdmin =
                state.userData?["esAdmin"] ?? false;

            Navigator.pushReplacementNamed(
              context,
              esAdmin ? AppRoutes.admin : AppRoutes.home,
            );
          } else {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.login,
            );
          }
        }
      },
      child: Scaffold(
        body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return SizedBox(
                width: totalWidth,
                height:
                    logoSize > textSize ? logoSize : textSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.translate(
                      offset: Offset(_textSlide.value, 0),
                      child: Opacity(
                        opacity: _textOpacity.value,
                        child: _image(
                          isDarkMode
                              ? "assets/icons/logo_recortado_light.png"
                              : "assets/icons/logo_recortado_dark.png",
                          textSize,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(_logoMove.value, 0),
                      child: ScaleTransition(
                        scale: _logoScale,
                        child: _image(
                          "assets/icons/logo_recortado.png",
                          logoSize,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}