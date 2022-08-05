import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_todo/data/thems.dart';

import 'Values/values.dart';

class DarkRadialBackground3 extends StatelessWidget {
  final String position1;
  final Color color1;
  var list = List.generate(
    3,
        (index) => HexColor.fromHex("1D192D"),
  );
  DarkRadialBackground3({required this.color1, required this.position1});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
          // alignment: AlignmentDirectional.topStart ,
          children:[
            Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Theme.of(context).primaryColorLight, Theme.of(context).scaffoldBackgroundColor],
                    center: (position1 == "bottomRight")
                        ? Alignment(1.0, 1.0)
                        : Alignment(-1.0, -0.9),
                  ),
                )
            ),
            Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Theme.of(context).primaryColorLight, Theme.of(context).scaffoldBackgroundColor],
                    center: (position1 == "bottomRight")
                        ? Alignment(-1.0, -1.0)
                        : Alignment(1.0, 0.9),
                  ),
                )
            ),

          ],
        )
    );
  }
}

// ignore: must_be_immutable
class DarkRadialBackground extends StatelessWidget {
  final String position;
  final Color color;
  var list = List.generate(
    3,
    (index) => HexColor.fromHex("1D192D"),
  );
  DarkRadialBackground({required this.color, required this.position});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
          // alignment: AlignmentDirectional.topStart ,
          children:[
            Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Theme.of(context).primaryColorLight, Theme.of(context).scaffoldBackgroundColor],
                    center: (position == "bottomRight")
                        ? Alignment(1.0, 1.0)
                        : Alignment(-1.0, -0.9),
                  ),
                )
            ),
          ],
        )
    );
  }
}
