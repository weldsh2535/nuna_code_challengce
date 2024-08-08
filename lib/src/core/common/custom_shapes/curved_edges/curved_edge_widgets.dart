
import 'package:flutter/material.dart';
import 'package:nuna_code_challenges/src/core/common/custom_shapes/curved_edges/curved_edge.dart';

class TCurvedEdgetWidget extends StatelessWidget {
  const TCurvedEdgetWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}