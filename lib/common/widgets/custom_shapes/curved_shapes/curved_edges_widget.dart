import 'package:blb/common/widgets/custom_shapes/curved_shapes/curved_edges.dart';
import 'package:flutter/material.dart';

class BLBCurvedEdgeWidget extends StatelessWidget {
  const BLBCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BLBCustomCurvedEdges(),
      child: child,
    );
  }
}
