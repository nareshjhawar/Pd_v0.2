import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Utils/thems.dart';
// import '../Home.dart';
import '../HomeScreen.dart';

import 'Drawer_widget.dart';
import 'package:flutter/services.dart';

class HidenDrawer extends StatefulWidget {
  User user;
  HidenDrawer({Key? key,required this.user}) : super(key: key);

  @override
  State<HidenDrawer> createState() => _HidenDrawerState();
}

class _HidenDrawerState extends State<HidenDrawer> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawingOpen;
  // int dely = 300;
  bool isDragging = false;

  void onpenDrawer() {
    setState(() {
      xOffset = 300;
      yOffset = 70;
      scaleFactor = 0.8;
      isDrawingOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawingOpen = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    closeDrawer();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Stack(children: [
        Mytheme.darkapp,
        DrawerWidget(
          closdDrawer: closeDrawer,
          user: widget.user,
        ),
        buildpage()
      ]
      )
  );

  Widget buildpage() {
    return GestureDetector(
      onHorizontalDragStart: (details) => isDragging = true,
      onHorizontalDragUpdate: (details) {
        if (!isDragging) return;
        const delta = 1;
        if (details.delta.dx > delta) {
          onpenDrawer();
        } else if (details.delta.dx < -delta) {
          closeDrawer();
        }
      },
      onTap: closeDrawer,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 230),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(isDrawingOpen ? 30 : 0),
            child: MyHomePage(
              opendrawer: onpenDrawer,
              user: widget.user
            ),
          )),
    );
  }
}
