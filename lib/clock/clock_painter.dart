import 'dart:math';

import "package:flutter/material.dart";

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xFF444974);
    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16.0;
    var centerFillBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..strokeWidth = 16.0;
    var secHandBrush = Paint()
      ..color = Colors.orange[300]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8.0;
    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0;
    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16.0;

    canvas.drawCircle(center, radius - 40.0, fillBrush);
    canvas.drawCircle(center, radius - 40.0, outlineBrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);

    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var hourHandX = centerX + 80 * cos((dateTime.hour * 30 + dateTime.minute) * 0.5 * pi / 180);
    var hourHandY = centerX + 80 * sin((dateTime.hour * 30 + dateTime.minute) * 0.5 * pi / 180);

    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    canvas.drawCircle(center, 16.0, centerFillBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
