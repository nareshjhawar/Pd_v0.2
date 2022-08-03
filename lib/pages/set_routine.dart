import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_todo/data/thems.dart';

class Set_Routine extends StatefulWidget {

  const Set_Routine({Key? key}) : super(key: key);

  @override
  _Set_RoutineState createState() => _Set_RoutineState();
}

class _Set_RoutineState extends State<Set_Routine> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();


  bool Ison = false;

  TextEditingController nameController = TextEditingController();

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
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
    final f2deco = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Theme.of(context).cardColor,
          Theme.of(context).canvasColor,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
      ),
      boxShadow: [
        BoxShadow(
          // color: Colors.transparent,
          color : Color(0xff7086e0).withOpacity(0.3),
          offset: const Offset(-5, 15),
          spreadRadius: 1,
          blurRadius: 20,
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(40)),
    ) ;


    return Scaffold(
      
      body: Stack(
        children: [
          Mytheme.darkapp,
          Stack(
            children:[
              Positioned(
              left: 39,
              top: 110,
              child: Container(
                width: 313,
                height: 124,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xffd9d9d9),
                ),
                child: Stack(
                  children:[
                    Positioned(
                      left: 167,
                      top: 13,
                      child: Container(
                        width: 118,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xff716d6d),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 167,
                      top: 66,
                      child: Container(
                        width: 118,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xff716d6d),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 38,
                      top: 23,
                      child: Text(
                        "Wake Up ",
                        style: TextStyle(
                          color: Color(0xff221f1f),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 38,
                      top: 76,
                      child: Text(
                        "Sleep at",
                        style: TextStyle(
                          color: Color(0xff221f1f),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
              Container(
                width: 390,
                height: 844,
                color: Color(0xbc928e8f),
                child: Stack(
                  children:[
                    Positioned(
                      left: 39,
                      top: 25,
                      child: Container(
                        width: 313,
                        height: 62,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xffd9d9d9),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 66,
                      top: 44,
                      child: Text(
                        "Week Days",
                        style: TextStyle(
                          color: Color(0xff221f1f),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 216,
                      top: 44,
                      child: Text(
                        "Weekends",
                        style: TextStyle(
                          color: Color(0xff221f1f),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 196,
                      top: 33,
                      child: Transform.rotate(
                        angle: 1.57,
                        child: Container(
                          width: 47,
                          height: 1,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 390,
                          height: 583,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
                            color: Color(0xffd9d9d9),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 36,
                      top: 347,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff292626),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 36,
                      top: 546,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff292626),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 36,
                      top: 446,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff292626),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 36,
                      top: 645,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff292626),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 43,
                      top: 367,
                      child: Transform.rotate(
                        angle: 1.57,
                        child: Container(
                          width: 75,
                          height: 1,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 43,
                      top: 566,
                      child: Transform.rotate(
                        angle: 1.57,
                        child: Container(
                          width: 75,
                          height: 1,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 43,
                      top: 467,
                      child: Transform.rotate(
                        angle: 1.57,
                        child: Container(
                          width: 75,
                          height: 1,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 43,
                      top: 666,
                      child: Transform.rotate(
                        angle: 1.57,
                        child: Container(
                          width: 75,
                          height: 1,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 74,
                      top: 355,
                      child: Container(
                        width: 284,
                        height: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xff716d6d),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 74,
                      top: 554,
                      child: Container(
                        width: 284,
                        height: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xff716d6d),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 74,
                      top: 454,
                      child: Container(
                        width: 284,
                        height: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xff716d6d),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 74,
                      top: 653,
                      child: Container(
                        width: 284,
                        height: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xff716d6d),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 39,
                      top: 278,
                      child: Text(
                        "Add your routine ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 39,
                      top: 311,
                      child: Text(
                        "(without any skip )",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 104,
                      top: 758,
                      child: Container(
                        width: 181,
                        height: 66,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xff2b2b2b),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 162,
                      top: 775,
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),],
          ),
        ],
      ),
    );
  }

  Future selectedTime(BuildContext context, bool ifPickedTime,
      TimeOfDay initialTime, Function(TimeOfDay) onTimePicked) async {
    var _pickedTime =
    await showTimePicker(context: context, initialTime: initialTime);
    if (_pickedTime != null) {
      onTimePicked(_pickedTime);
    }
  }

  Widget _buildTimePick( bool ifPickedTime, TimeOfDay currentTime,
      Function(TimeOfDay) onTimePicked) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).primaryColor
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: GestureDetector(
            child: Text(
              currentTime.format(context),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
            ),
            onTap: () {
              selectedTime(context, ifPickedTime, currentTime, onTimePicked);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({required String hintText}){
    return Container(
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          focusColor: Theme.of(context).primaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:Theme.of(context).primaryColor,width: 2,style: BorderStyle.solid
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.6),width: 2,style: BorderStyle.solid
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: hintText,
          labelStyle: TextStyle(
              color: Theme.of(context).primaryColor
          ),
        ),),
    );
  }
}
