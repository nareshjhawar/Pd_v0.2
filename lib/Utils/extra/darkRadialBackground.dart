import 'dart:ui';
import 'package:flutter/material.dart';

//Dark background for all screens
// ignore: must_be_immutable
class DarkRadialBackground extends StatelessWidget {
  final String position;
  final Color color ;
  var list = List.generate(
    3,
        (index) => const Color(0xff1D192D),
  );
  DarkRadialBackground({Key? key,
    required this.color,
    required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
          // alignment: AlignmentDirectional.topStart ,
          children:[
            Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Theme.of(context).primaryColorLight,
                      Theme.of(context).scaffoldBackgroundColor],
                    center: (position == "bottomRight")
                        ? const Alignment(1.0, 1.0)
                        : const Alignment(-1.0, -0.9),
                  ),
                )
            ),
          ],
        )
    );
  }
}
