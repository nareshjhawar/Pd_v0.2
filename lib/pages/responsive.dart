import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/videoPage.dart';

import '../data/thems.dart';
import 'button_change_them.dart';

class Responsive extends StatefulWidget {
  VoidCallback opendrawer;

  Responsive({Key? key, required this.opendrawer}) : super(key: key);

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      // backgroundColor: Colors.black54,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: widget.opendrawer,
                  icon: const Icon(
                    Icons.bar_chart_rounded,
                    color: Mytheme.primary_color,
                    size: 32,
                  )),
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
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.blueAccent,
        margin: const EdgeInsets.fromLTRB(20, 90, 20, 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // you can use other library also to customize this
                // the height will we increased as much of page
                // if content is more then we can use fixed height container
                // and row inside the container

                // will do timeline after the designing of the page

                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const VideoPage();
                    });
              },
              child: Container(
                color: Colors.black,
                height: he * .2,
                width: we,
              ),
            ),
            const Text(
              'EIAD concept categories',
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              'Categories',
              style: TextStyle(fontSize: 20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: Row(
                  children: List.generate(
                    5,
                    (index) => Container(
                      height: he * .1,
                      width: we * .2,
                      color: Colors.white,
                      child: Center(child: Text('Task : $index')),
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              'Recommended Time Line',
              style: TextStyle(fontSize: 20),
            ),
            // List Time Line will add later
          ],
        ),
      ),
    );
  }
}
