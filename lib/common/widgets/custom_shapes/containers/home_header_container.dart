import 'package:flutter/material.dart';

class BLBHomeHeaderContainer extends StatelessWidget {
  const BLBHomeHeaderContainer({
    super.key,
    required this.child,
    required this.height,
  });

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BLBHomeCurvedEdgeWidget(
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

class BLBHomeCurvedEdgeWidget extends StatelessWidget {
  const BLBHomeCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BLBHomeCustomCurvedEdges(),
      child: child,
    );
  }
}

class BLBHomeCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0,
        size.height); //starting point, size is the size of the current container

    final firstCurve = Offset(0, size.height);
    final lastFCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastFCurve.dx, lastFCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
