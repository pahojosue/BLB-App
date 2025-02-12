import 'package:flutter/material.dart';

class BLBCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0,
        size.height); //starting point, size is the size of the current container

    final firstCurve = Offset(0, size.height - 20);
    final lastFCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastFCurve.dx, lastFCurve.dy);

    final secondCurve = Offset(0, size.height - 20);
    final lastSCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
        secondCurve.dx, secondCurve.dy, lastSCurve.dx, lastSCurve.dy);

    final thirdCurve = Offset(size.width, size.height - 20);
    final lastTCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(
        thirdCurve.dx, thirdCurve.dy, lastTCurve.dx, lastTCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
