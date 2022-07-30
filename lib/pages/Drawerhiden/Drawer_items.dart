import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItem {
  String title;
  IconData icon;
  // onPressed

  DrawerItem({required this.title, required this.icon});
}

class DrawerItems {
  static final home =
      DrawerItem(title: "Home", icon: Icons.grid_view_outlined);
  static final profile =
      DrawerItem(title: "Profile", icon: Icons.person_outlined);
  static final logout =
      DrawerItem(title: "Logout", icon: Icons.logout);
  // static final routine =
  //     DrawerItem(title: "Routine", icon: Icons.grid_view_outlined);
  // static final analytics =
  //     DrawerItem(title: "Analytics", icon: FontAwesomeIcons.chartPie);
  //
  // static final recommend =
  //     DrawerItem(title: "Recommend", icon: Icons.person_outlined);

  static final List<DrawerItem> all = [home,profile,logout];
}
