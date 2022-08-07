import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/thems.dart';

class ChangeThembutton extends StatefulWidget {
  ChangeThembutton({Key? key}) : super(key: key);

  @override
  State<ChangeThembutton> createState() => _ChangeThembuttonState();
}

class _ChangeThembuttonState extends State<ChangeThembutton> {
  bool Ison = false;
  bool Isicons = false;

  bool islight = true;

  @override
  Widget build(BuildContext context) {
    // Todo this button for change them of app .. 
    final themprovider = Provider.of<ThemProvider>(context);
    return IconButton(
        onPressed: () {
          final provider = Provider.of<ThemProvider>(context, listen: false);
          Isicons = !Isicons;
          Ison = themprovider.isDarkMode ;

          // SimpleGlobal.isdark_mode = Ison ;

          // TweenAnimationBuilder(
          //     tween: Tween(begin: 0.0,end: 1.0),
          //     duration: Duration(milliseconds: 1500),
          //     child: provider.toggleThem(Ison),
          //     builder: _ChangeThembuttonState);
          // Ison = Ison ? themprovider.isLightMode :  themprovider.isDarkMode;
          provider.toggleThem(Ison);
        },
        icon: Isicons
            ?  Icon(
                Icons.light_mode_outlined,
                color: Theme.of(context).primaryColor,
              )
            :  Icon(
                Icons.mode_night_outlined,
                color: Theme.of(context).primaryColor,
              )
    );
  }
}
