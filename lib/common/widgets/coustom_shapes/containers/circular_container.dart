import 'package:flutter/material.dart';

class TCircuarContainer extends StatelessWidget {
  const TCircuarContainer({
    super.key,
    this.height = 400,
    this.width = 400,
    this.radius = 400,
    this.padding = 0,
    required this.backgroundColor,
  });

  final double? height;
  final double? width;
  final double radius;
  final double padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
    );
  }
}