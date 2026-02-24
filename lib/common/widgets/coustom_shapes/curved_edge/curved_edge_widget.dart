import 'package:ferremateriales/common/widgets/coustom_shapes/curved_edge/curved_edge.dart';
import 'package:flutter/material.dart';

class TCurveEdgedWidget extends StatelessWidget {
  const TCurveEdgedWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomCurvedEdges(), child: child);
  }
}