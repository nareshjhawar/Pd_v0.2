import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_todo/data/thems.dart';

import 'Values/values.dart';


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
class DarkRadialBackground2 extends StatelessWidget {
  late final String position= "topLeft";
  late final Color color =HexColor.fromHex("#181a1f");
  var list = List.generate(
    3,
        (index) => HexColor.fromHex("1D192D"),
  );
  // DarkRadialBackground({required this.color, required this.position});
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
            Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Theme.of(context).primaryColorLight, Theme.of(context).scaffoldBackgroundColor],
                    center: (position == "bottomRight")
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