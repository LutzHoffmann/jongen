import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PosText extends StatelessWidget {
  final double left;
  final double top;
  final String text;
  final double deg;

  PosText(this.left, this.top, this.text, this.deg);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(deg / 360),
        child: Text(
          '= ' + text,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
