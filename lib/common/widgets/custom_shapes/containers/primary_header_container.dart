import 'package:blb/common/widgets/custom_shapes/curved_shapes/curved_edges_widget.dart';
import 'package:flutter/material.dart';

class BLBPrimaryHeaderContainer extends StatelessWidget {
  const BLBPrimaryHeaderContainer({
    super.key,
    required this.child,
    required this.height,
  });

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BLBCurvedEdgeWidget(
      child: SizedBox(
        height: this.height,
        child: Container(
          color: Color.fromRGBO(53, 237, 237, 1),
          child: Stack(
            children: [
              child,
            ],
          ),
        ),
      ),
    );
  }
}
