import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';

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

  // 🔧 AJUSTA SOLO ESTO
  static const double logoSize = 90;
  static const double textSize = 150;
  static const double spacing = -2; // negativo = más pegados

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    // POP del logo
    _logoScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.35, curve: Curves.elasticOut),
      ),
    );

    // LOGO se mueve a la izquierda después del pop
    _logoMove = Tween<double>(begin: 0, end: -(textSize / 2)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 1.0, curve: Curves.easeOut),
      ),
    );

    // TEXTO sale desde dentro del logo
    _textSlide = Tween<double>(
      begin: 0,
      end: (logoSize / 2) + spacing,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.45, 1.0, curve: Curves.easeOut),
      ),
    );

    // aparición del texto
    _textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.45, 1.0),
      ),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
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

    // 🔥 DETECTA SI ES MODO OSCURO
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final totalWidth = logoSize + textSize;

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {

            return SizedBox(
              width: totalWidth,
              height: logoSize > textSize ? logoSize : textSize,
              child: Stack(
                alignment: Alignment.center,
                children: [

                  // 🔤 TEXTO
                  Transform.translate(
                    offset: Offset(_textSlide.value, 0),
                    child: Opacity(
                      opacity: _textOpacity.value,
                      child: _image(
                        isDarkMode
                          ? "assets/icons/logo_recortado_light.png" // blanco
                          : "assets/icons/logo_recortado_dark.png",  // negro
                        textSize,
                      ),
                    ),
                  ),

                  // 🔵 LOGO
                  Transform.translate(
                    offset: Offset(_logoMove.value, 0),
                    child: ScaleTransition(
                      scale: _logoScale,
                      child: _image(
                        isDarkMode
                          ? "assets/icons/logo_recortado.png"       // blanco
                          : "assets/icons/logo_recortado.png",// negro
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
    );
  }
}