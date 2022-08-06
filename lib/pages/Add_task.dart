import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_todo/Animation/fadeAnimation.dart';
import 'package:flutter_todo/data/thems.dart';
import 'package:google_fonts/google_fonts.dart';

class Add_task extends StatefulWidget {
  // final Note? note;

  const Add_task({Key? key}) : super(key: key);

  @override
  _Add_taskState createState() => _Add_taskState();
}

class _Add_taskState extends State<Add_task> {
  // late String time;
  // late String description;
  // late String slot;


  bool Ison = false;
  final _controller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  // get nameController => null;
  TextEditingController nameController = TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // time = widget.note?.time ?? '';
  //   description = widget.note?.description ?? ''; // for get null or value
  //   // slot = widget.note?.slot ?? '';
  // }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    final tsytle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 30,
      fontWeight: FontWeight.w700,
    );
    final tsytle1 = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
    final f2deco = BoxDecoration(
      gradient: LinearGradient(
        colors: [//0xFF5C5292
          Theme.of(context).cardColor.withOpacity(0.7),
          Theme.of(context).canvasColor.withOpacity(0.7),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
      ),
      borderRadius: BorderRadius.all(Radius.circular(40)),
    ) ;

    return Container(
      width: 390,
      height: 844,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 24, right: 39, top: 45, bottom: 72, ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Color(0xfff1f6ff),
                  blurRadius: 13,
                  offset: Offset(-3, 7),
                ),
              ],
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  width: 24,
                  height: 24,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:[
                      Container(
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(height: 639),
                      Transform.rotate(
                        angle: 1.57,
                        child: Container(
                          width: 15.50,
                          height: 8.50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color(0xff121355), width: 1.50, ),
                            color: Color(0x7f7f3a44),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.29),
          Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff10275a),
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8.29),
          Text(
            "Tittle",
            style: TextStyle(
              color: Color(0xff8a8ab2),
              fontSize: 14,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.29),
          Text(
            "Plan for a month",
            style: TextStyle(
              color: Color(0xff10275a),
              fontSize: 16,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.29),

          SizedBox(height: 8.29),
          Text(
            "Date",
            style: TextStyle(
              color: Color(0xff8a8ab2),
              fontSize: 14,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.29),
          Container(
            width: 20,
            height: 20,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  width: 20,
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2, ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Container(
                        width: 15,
                        height: 16.67,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FlutterLogo(size: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.29),
          Text(
            "4 August 2021",
            style: TextStyle(
              color: Color(0xff10275a),
              fontSize: 16,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.29),

          SizedBox(height: 8.29),
          Text(
            "Time",
            style: TextStyle(
              color: Color(0xff8a8ab2),
              fontSize: 14,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.29),
          Container(
            width: 83,
            height: 19,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Text(
                  "07:00",
                  style: TextStyle(
                    color: Color(0xff10275a),
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 17),
                Text(
                  "AM",
                  style: TextStyle(
                    color: Color(0xff10275a),
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.29),
          Container(
            width: 83,
            height: 19,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Text(
                  "07:30",
                  style: TextStyle(
                    color: Color(0xff10275a),
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 17),
                Text(
                  "AM",
                  style: TextStyle(
                    color: Color(0xff10275a),
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.29),

          SizedBox(height: 8.29),

          SizedBox(height: 8.29),
          Text(
            "Description",
            style: TextStyle(
              color: Color(0xff8a8ab2),
              fontSize: 14,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.29),
          Text(
            "Creating this month's work plan",
            style: TextStyle(
              color: Color(0xff10275a),
              fontSize: 16,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.29),
          Container(
            width: 14,
            height: 14,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  width: 14,
                  height: 14,
                  child: Stack(
                    children:[
                      Container(
                        width: 14,
                        height: 14,
                        color: Colors.black,
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 1.75,
                            height: 9.10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: FlutterLogo(size: 1.75),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.29),

          SizedBox(height: 8.29),
          Text(
            "Type",
            style: TextStyle(
              color: Color(0xff8a8ab2),
              fontSize: 14,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.29),
          Text(
            "Personal",
            style: TextStyle(
              color: Color(0xff10275a),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8.29),
          Text(
            "Private",
            style: TextStyle(
              color: Color(0xff121355),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8.29),
          Text(
            "Secret",
            style: TextStyle(
              color: Color(0xff121355),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8.29),
          Container(
            width: 16,
            height: 16,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  width: 16,
                  height: 16,
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Container(
                        width: 12.33,
                        height: 12.33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FlutterLogo(size: 12.333333969116211),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.29),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Color(0xffe3eaff), width: 0.79, ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xfff1f6ff),
                  blurRadius: 4,
                  offset: Offset(-0.92, 2.15),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.29),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Color(0xffe3eaff), width: 0.79, ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xfff1f6ff),
                  blurRadius: 4,
                  offset: Offset(-0.92, 2.15),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.29),
          Text(
            "Tags",
            style: TextStyle(
              color: Color(0xff8a8ab2),
              fontSize: 14,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.29),
          Container(
            width: 327,
            height: 34,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  width: 77,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Color(0xffeceaff),
                  ),
                  padding: const EdgeInsets.only(top: 7, bottom: 5, ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      SizedBox(
                        width: 37,
                        height: 22,
                        child: Text(
                          "Office",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff8f81fe),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 6),
                Container(
                  width: 77,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Color(0xffffefeb),
                  ),
                  padding: const EdgeInsets.only(top: 7, bottom: 5, ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      SizedBox(
                        width: 37,
                        height: 22,
                        child: Text(
                          "Home",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xfff0a48e),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 6),
                Container(
                  width: 82,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Color(0xffffe9ed),
                  ),
                  padding: const EdgeInsets.only(top: 7, bottom: 5, ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      SizedBox(
                        width: 42,
                        height: 22,
                        child: Text(
                          "Urgent",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xfff57c96),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 6),
                Container(
                  width: 73,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Color(0xffd1feff),
                  ),
                  padding: const EdgeInsets.only(top: 7, bottom: 5, ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      SizedBox(
                        width: 33,
                        height: 22,
                        child: Text(
                          "Work",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff1ec1c3),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.29),
          Text(
            "+ Add new tag",
            style: TextStyle(
              color: Color(0xffa8aedf),
              fontSize: 12,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.29),
          Container(
            width: 327,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Color(0xfff1f6ff),
                  blurRadius: 13,
                  offset: Offset(-3, 7),
                ),
              ],
              color: Color(0xff5b67ca),
            ),
            padding: const EdgeInsets.only(left: 138, right: 136, top: 15, bottom: 20, ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Text(
                  "Create",
                  style: TextStyle(
                    color: Color(0xfffeffff),
                    fontSize: 18,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
