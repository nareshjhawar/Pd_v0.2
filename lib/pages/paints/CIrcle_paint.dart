import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/global_myvar.dart';
import 'package:flutter_todo/pages/mysettings.dart';
import 'package:get/utils.dart';

import '../../data/thems.dart';

class CirclePainter extends CustomPainter {

  final _paint = Paint()
    ..color = SimpleGlobal.isdark_mode ? Mytheme.darkthem.primaryColor
        : Mytheme.lightthem.focusColor.withAlpha(90)
    ..strokeWidth = 2.5
    // ..style = Shadow( )
  // Use [PaintingStyle.fill] if you want the circle to be filled.
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}