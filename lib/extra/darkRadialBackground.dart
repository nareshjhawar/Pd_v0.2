import 'package:flutter/material.dart';

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
                    colors: [...list, this.color],
                    center: (position == "bottomRight")
                        ? Alignment(1.0, 1.0)
                        : Alignment(-1.0, -0.9),
                  ),
                )
            ),
            // Container(
            //     decoration: BoxDecoration(
            //       gradient: RadialGradient(
            //         // transform: GradientRotation(0.25),
            //         radius: 1.9,
            //         focalRadius: 50,
            //         colors: [Color(0xFF5B3FDB).withOpacity(0.4), Colors.transparent],
            //         center: (position == "topRight")
            //             ? Alignment(1.4, 0.0)
            //             : AlignmentDirectional(2.2, -0.9),
            //       ),
            //     )
            // ),
          ],
        )
    );
  }
}
class LightRadialBackground extends StatelessWidget {
  final String position1;
  final Color color1;
  var list = List.generate(
    2,
        (index) => HexColor.fromHex("868af7"),
  );
  LightRadialBackground({required this.color1, required this.position1});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
          children:[
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [...list, this.color1],
                  center: (position1 == "bottomRight")
                      ? Alignment(1.0, 1.0)
                      : Alignment(-1.0, -0.9),
                ),
              )
          ),
            Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    // transform: GradientRotation(0.25),
                    radius: 1.5,
                    focalRadius: 50,
                    colors: [Colors.pinkAccent.withOpacity(0.8), Colors.transparent],
                    center: (position1 == "topRight")
                        ? Alignment(1.4, 0.0)
                        : AlignmentDirectional(2.8, -0.8),
                  ),
                )
            ),
          ],
        )
    );
  }
}