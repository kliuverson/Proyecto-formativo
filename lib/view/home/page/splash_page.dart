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

  late Animation<double> _logoScale;   // efecto POP
  late Animation<double> _textSlide;   // movimiento horizontal
  late Animation<double> _textOpacity; // aparición suave

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    //  LOGO POP (zoom con rebote)
    _logoScale = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    //  TEXTO SALE DESDE EL LOGO
    _textSlide = Tween<double>(begin: 0, end: 70).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 1.0, curve: Curves.easeOut),
      ),
    );

    //  TEXTO APARECE SUAVE
    _textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.45, 1.0),
      ),
    );

    _controller.forward();

    // Navegación automática
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

  @override
  Widget build(BuildContext context)
   {   const double size = 100;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return SizedBox(
              width: 260,
              height: 120,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [

                  //  TEXTO QUE SALE DEL LOGO
                  Positioned(
                    left: _textSlide.value,
                    child: Opacity(
                      opacity: _textOpacity.value,
                      child: Image.asset(
                        "assets/icons/letra_R.png",
                        height: size,
                        width: size,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  //  LOGO ENCIMA (para que parezca que el texto sale de adentro)
                  ScaleTransition(
                    scale: _logoScale,
                    child: Image.asset(
                      "assets/icons/logo_recortado.png",
                      height: size,
                      width: size,
                      fit: BoxFit.contain,
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
