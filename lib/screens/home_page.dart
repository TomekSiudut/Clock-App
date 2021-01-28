import "package:flutter/material.dart";
import 'package:timely/widgets/clock_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(alignment: Alignment.center, color: Color(0xFF2D2F41), child: ClockView()));
  }
}
