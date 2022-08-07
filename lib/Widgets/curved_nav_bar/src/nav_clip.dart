import 'package:flutter/cupertino.dart';

class ClipPathClass extends CustomClipper<Path>{
  late double loc;
  late double s;
  TextDirection textDirection;

  ClipPathClass(
      double startingLoc,
      int itemsLength,
      this.textDirection,
      ){
    final span = 1.0 / itemsLength;
    s = 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  Path getClip(Size size){
    // double w = size.width;
    // double h = size.height;

    // final path =Path();
    // // (0,0 ) // 1.Point
    // path.lineTo(0, h);
    // path.lineTo(w, h);
    // path.lineTo(w, 0);
    // path.close();
    final path1 = Path();
      // path1
    path1.moveTo(0, 0);
    path1.lineTo((loc - 0.1) * size.width, 0);
    path1.cubicTo(
        (loc + s * 0.20) * size.width,
        size.height * 0.05,
        loc * size.width,
        size.height * 0.60,
        (loc + s * 0.50) * size.width,
        size.height * 0.60,
      );
    path1.cubicTo(
        (loc + s) * size.width,
        size.height * 0.60,
        (loc + s - s * 0.20) * size.width,
        size.height * 0.05,
        (loc + s + 0.1) * size.width,
        0,
      );
    path1.lineTo(size.width, 0);
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();

    return path1;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return this != oldClipper;
  }
}