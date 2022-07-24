import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_todo/data/thems.dart';
import 'package:provider/provider.dart';

// import '../curved_navigation_bar.dart';
import 'button_change_them.dart';

class MyRoutine extends StatefulWidget {
  VoidCallback opendrawer;
  MyRoutine({required this.opendrawer});

  @override
  State<MyRoutine> createState() => _MyRoutineState();
}

class _MyRoutineState extends State<MyRoutine> {

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    final themprovider = Provider.of<ThemProvider>(context);

    final bdeco = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Theme.of(context).cardColor.withOpacity(0.7),
          Theme.of(context).canvasColor.withOpacity(0.7),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
      ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
            color: Theme.of(context).shadowColor,
            offset: Offset(4,4),
            blurRadius: 15,
            spreadRadius: 1.0
        ),
        BoxShadow(
            color: Theme.of(context).shadowColor,
            offset: Offset(4,4),
            blurRadius: 15,
            spreadRadius: 1.0
        )
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation:0,
          backgroundColor: Colors.transparent,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Icon(
                      Icons.bar_chart_rounded,
                      color: Theme.of(context).primaryColor ,
                      size: 32,
                    ),
                SizedBox(
                  width: we * 0.42,
                ),

                SizedBox(
                  width: we * 0.3,
                ),
                ChangeThembutton()
              ],
            )
          ],
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Mytheme.darkapp,
          Center(
            child: Container(
              height: 100,
              width: 300,
              decoration: bdeco,
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(40),
              //   child: BackdropFilter(
              //     filter: ImageFilter.blur(sigmaY: 5,sigmaX: 5),
              //     child: Container(
              //       height: 10,
              //       width: 20,
              //       decoration: BoxDecoration(
              //         color: Colors.transparent,
              //       ),
              //     ),
              //   ),
              // ),
            ),
          ),

        ],
      ),
    );

  }
}