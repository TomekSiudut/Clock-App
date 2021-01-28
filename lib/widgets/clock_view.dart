import 'dart:math';

import "package:flutter/material.dart";
import 'package:timely/clock/clock_painter.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300.0,
        height: 300.0,
        child: Transform.rotate(
          angle: -pi / 2,
          child: CustomPaint(
            painter: ClockPainter(),
          ),
        ));
  }
}
