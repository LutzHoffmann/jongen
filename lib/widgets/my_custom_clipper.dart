import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var startPoint = Offset(0, 0);
    var controlPoint1 = Offset(0, size.height);
    var controlPoint2 = Offset(size.width - 50, size.height / 2);
    var endPoint = Offset(size.width, size.height);
    Path path = Path()
      ..moveTo(startPoint.dx, startPoint.dy)
      ..lineTo(0, 0)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
