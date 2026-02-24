import 'package:ferremateriales/common/widgets/coustom_shapes/containers/circular_container.dart';
import 'package:ferremateriales/common/widgets/coustom_shapes/curved_edge/curved_edge_widget.dart';
import 'package:flutter/material.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurveEdgedWidget(
      child: Container(
        color: Color(0xFF4b68ff),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TCircuarContainer(
                backgroundColor: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircuarContainer(
                backgroundColor: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
