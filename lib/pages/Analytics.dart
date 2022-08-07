import 'package:flutter/material.dart';

import '../Utils/thems.dart';
import '../Widgets/button_change_them.dart';

class MyAnalytics extends StatefulWidget {
  const MyAnalytics({Key? key}) : super(key: key);

  @override
  State<MyAnalytics> createState() => _MyAnalyticsState();
}

class _MyAnalyticsState extends State<MyAnalytics> {
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
          Text('Anayltics')
        ],
      ),
    );
  }
}
