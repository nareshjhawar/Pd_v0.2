import 'package:flutter/material.dart';

import '../data/thems.dart';
import 'button_change_them.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

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
      body: Stack(
        children: [
          Mytheme.darkapp,
        ],
      ),
    );
  }
}
