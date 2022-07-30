import 'package:flutter/material.dart';
import 'package:flutter_todo/data/thems.dart';
import 'package:flutter_todo/pages/global_myvar.dart' as Globals;
import 'package:flutter_todo/pages/homepage.dart';

import 'package:flutter_todo/pages/myanalytics.dart';
import 'package:flutter_todo/pages/myprofile.dart';
import 'package:flutter_todo/pages/myroutine.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Avatar_progerss.dart';
import '../chart.dart';
import '../responsive.dart';
import 'drawer_items.dart';

class DrawerWidget extends StatefulWidget {
  VoidCallback closdDrawer;
  DrawerWidget({required this.closdDrawer});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget>
    with SingleTickerProviderStateMixin {

  final double runanim = 0.4;

    late double xOffset;
    late double yOffset;
    late double scaleFactor;
    late bool isDrawingOpen;

    bool isDragging = false;


  void onpenDrawer() {
    setState(() {
      xOffset = 300;
      yOffset = 70;
      scaleFactor = 0.8;
      isDrawingOpen = false;
    });
  }
  late final List? _widgetOption=[
    MyHomePage(opendrawer: onpenDrawer,),
    MyProfile(),
    MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
        child: Column(
      children: [
        _buildButton(context),
        Container(margin:EdgeInsets.only(left: 60),
            child: Progerss_Avater()),
        SizedBox(
          height: he * 0.02,
        ),
        _buidText(context),
        // SizedBox(
        //   height: he * 0.002,
        // ),
        buildDrawerItem(context),
        // SizedBox(
        //   height: he * 0.002,
        // ),
        Chart()
      ],
    ));
  }

  Widget buildDrawerItem(BuildContext context) =>
      Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          children: [
            Container(
              height: 300,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context,hindex){
                List<DrawerItem> items=DrawerItems.all;
                return ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                              leading:
                                Icon(
                                  items[hindex].icon,
                                  color: Theme.of(context).focusColor,
                                  size: 25,
                              ),
                              title: Text(
                                items[hindex].title,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).focusColor),
                              ),
                          onTap: ()=>Navigator.push(context,MaterialPageRoute(
                              builder: (context)=>_widgetOption?[
                                hindex],)),
                            );
                  }),
            )
          ],
          // children: DrawerItems.all.map((item) =>
        ),
       );
  Widget _buildButton(context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: he * 0.09, left: we * 0.15),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.2),
            offset: const Offset(-5,5),
            spreadRadius: 1,
            blurRadius: 20,
          ),
        ],
      ),
      child: Container(
          width: 47,
          height: 47,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).cardColor,
          ),
          child: IconButton(
              onPressed: widget.closdDrawer,
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
                size: 20,
              ))),
    );
  }

  Widget _buidText(context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(right: we * 0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Naresh Jhawar",
            style: GoogleFonts.dancingScript(
                fontSize: 30,
                letterSpacing: 1,
                color: Theme.of(context).focusColor,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

// old copy

// import 'package:flutter/material.dart';
// import 'package:flutter_todo/data/thems.dart';
// import 'package:flutter_todo/pages/global_myvar.dart' as Globals;
//
// import 'package:flutter_todo/pages/myanalytics.dart';
// import 'package:flutter_todo/pages/myprofile.dart';
// import 'package:flutter_todo/pages/myroutine.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../Avatar_progerss.dart';
// import '../chart.dart';
// import 'drawer_items.dart';
//
// class DrawerWidget extends StatefulWidget {
//   VoidCallback closdDrawer;
//   DrawerWidget({required this.closdDrawer});
//
//   @override
//   State<DrawerWidget> createState() => _DrawerWidgetState();
// }
//
// class _DrawerWidgetState extends State<DrawerWidget>
//     with SingleTickerProviderStateMixin {
//   final double runanim = 0.4;
//   // static late final hindex = SimpleGlobal.hindex;
//
//   @override
//   Widget build(BuildContext context) {
//     var we = MediaQuery.of(context).size.width;
//     var he = MediaQuery.of(context).size.height;
//
//     return SingleChildScrollView(
//         child: Column(
//           children: [
//             _buildButton(context),
//             Container(margin:EdgeInsets.only(left: 60),
//                 child: Progerss_Avater()),
//             SizedBox(
//               height: he * 0.02,
//             ),
//             _buidText(context),
//             SizedBox(
//               height: he * 0.02,
//             ),
//             buildDrawerItem(context),
//             SizedBox(
//               height: he * 0.02,
//             ),
//             Chart()
//           ],
//         ));
//   }
//
//   Widget buildDrawerItem(BuildContext context) => Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Column(
//       children: [
//         SizedBox(
//           height: 200,
//           child: Row(
//             children: [
//               TextButton(onPressed: onPressed,
//                   child: Text("Routine"))
//             ],
//           ),
//         )
//       ],
//       // children: DrawerItems.all.map((item) =>
//     ),
//   );
//   Widget _buildButton(contex) {
//     var we = MediaQuery.of(context).size.width;
//     var he = MediaQuery.of(context).size.height;
//
//     return Container(
//       margin: EdgeInsets.only(top: he * 0.09, left: we * 0.15),
//       width: 50,
//       height: 50,
//       alignment: Alignment.center,
//       // decoration:
//       //     const BoxDecoration(
//       //         color: Mytheme.prime_color2,
//       //         shape: BoxShape.circle,
//       //
//       //     ),
//       decoration: BoxDecoration(
//         // color: Theme.of(context).primaryColor,
//         shape: BoxShape.circle,
//         boxShadow: [
//           BoxShadow(
//             color: Theme.of(context).shadowColor.withOpacity(0.3),
//             offset: const Offset(-5,5),
//             spreadRadius: 4,
//             blurRadius: 20,
//           ),
//         ],
//       ),
//       child: Container(
//           width: 47,
//           height: 47,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Theme.of(context).cardColor,
//           ),
//           child: IconButton(
//               onPressed: widget.closdDrawer,
//               icon: const Icon(
//                 Icons.arrow_back_ios_outlined,
//                 color: Colors.white,
//                 size: 20,
//               ))),
//     );
//   }
//
//   Widget _buidText(context) {
//     var we = MediaQuery.of(context).size.width;
//     var he = MediaQuery.of(context).size.height;
//
//     return Container(
//       margin: EdgeInsets.only(right: we * 0.35),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Naresh Jhawar",
//             style: GoogleFonts.dancingScript(
//                 fontSize: 30,
//                 letterSpacing: 1,
//                 color: Theme.of(context).focusColor,
//                 fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }
