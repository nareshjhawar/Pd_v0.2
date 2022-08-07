import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;
  late Gradient gradient;

  NavCustomPainter(
      double startingLoc,
      int itemsLength,
      this.color,
      this.textDirection,
      [ Gradient? gradient]
      ){
    final span = 1.0 / itemsLength;
    s = 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
    this.gradient = (gradient)!;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = (gradient == null)?
    (Paint()
      ..color = color
      ..style = PaintingStyle.fill) :
    (Paint()
      ..shader = ui.Gradient.linear(
          Offset(200,-30),
          Offset(200,40),
          [gradient.colors[0],
            gradient.colors[1]])
      // ..imageFilter = ui.ImageFilter.blur(sigmaX: 3,sigmaY: 3,tileMode: TileMode.decal)
    // ..maskFilter = MaskFilter.blur(BlurStyle.normal,200)
      ..style = PaintingStyle.fill) ;


    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0.1) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.20) * size.width,
        size.height * 0.05,
        loc * size.width,
        size.height * 0.60,
        (loc + s * 0.50) * size.width,
        size.height * 0.60,
      )
      ..cubicTo(
        (loc + s) * size.width,
        size.height * 0.60,
        (loc + s - s * 0.20) * size.width,
        size.height * 0.05,
        (loc + s + 0.1) * size.width,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
