import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';

import '../Utils/thems.dart';
import '../data/data_model.dart';
import 'BottomSheets/RoutineTask.dart';

class Set_Routine extends StatefulWidget {
  User user;

  Set_Routine({Key? key, required this.user}) : super(key: key);

  @override
  _Set_RoutineState createState() => _Set_RoutineState();
}

class _Set_RoutineState extends State<Set_Routine> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  bool isLoading=false;
  bool Ison = false;
  DateTime dateTime = DateTime.now();

  List<TaskModel> routine=[];
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.user.uid)
          .get();
      for(var s in userSnap.data()!['routine']){
        TaskModel task=TaskModel.fromMap(s);
        routine.add(task);
      }
      setState(() {});
    } catch (e) {
      Fluttertoast.showToast(msg: 'error in getting data');
    }
    setState(() {
      isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    final tsytle = TextStyle(
      color: Theme.of(context).focusColor,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
    final tsytle1 = TextStyle(
      color: Theme.of(context).focusColor,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );
    final f2deco = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Theme.of(context).cardColor.withOpacity(0.9),
          Theme.of(context).canvasColor.withOpacity(0.9),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
      ),
      boxShadow: [
        BoxShadow(
          // color: Colors.transparent,
          color: const Color(0xff7086e0).withOpacity(0.1),
          offset: const Offset(-5, 5),
          spreadRadius: 1,
          blurRadius: 10,
        ),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(30)),
    );
    final f4deco = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Theme.of(context).cardColor.withOpacity(0.7),
          Theme.of(context).canvasColor.withOpacity(0.2),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(30)),
    );

    final b_deco = ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(5)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
    final b_deco2 = ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(0)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );

    return Scaffold(
      body: Stack(
        children: [
          Mytheme.darkapp,
          Positioned(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Color(0x80411d47),
                  boxShadow: [
                    BoxShadow(
                      // color: Colors.transparent,
                      color: const Color(0xc32e175a).withOpacity(0.3),
                      offset: const Offset(-5, 5),
                      spreadRadius: 10,
                      blurRadius: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Color(0x80411d47),
                  boxShadow: [
                    BoxShadow(
                      // color: Colors.transparent,
                      color: const Color(0xff332553).withOpacity(0.3),
                      offset: const Offset(-5, 5),
                      spreadRadius: 10,
                      blurRadius: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text("Routine",
                    style: TextStyle(
                      color: Color(0xff9370b1).withAlpha(40),
                      fontFamily: 'poppins',
                      fontSize: 75,
                      fontWeight: FontWeight.w700,
                    ),
                  )
              ),
              SizedBox(height: he * 0.01),
              Container(
                clipBehavior: Clip.none,
                padding:
                    const EdgeInsets.fromLTRB(30,5,30,15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      days('S', tsytle1),
                      SizedBox(width: we * 0.04),
                      days('M', tsytle1),
                      SizedBox(width: we * 0.04),
                      days('T', tsytle1),
                      SizedBox(width: we * 0.04),
                      days('W', tsytle1),
                      SizedBox(width: we * 0.04),
                      days('T', tsytle1),
                      SizedBox(width: we * 0.04),
                      days('F', tsytle1),
                      SizedBox(width: we * 0.04),
                      days('S', tsytle1),
                      SizedBox(width: we * 0.04),
                    ],
                  ),
                ),
              ),
              SizedBox(height: he * 0.01),
              Container(
                decoration: f2deco,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Wake up",
                          style: tsytle1,
                        ),
                        SizedBox(width: we * 0.2),
                        Center(
                          child: _buildTimePick(true, startTime, (x) {
                            setState(() {
                              startTime = x;
                              print("The picked time is: $x");
                            });
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Sleep at",
                          style: tsytle1,
                        ),
                        SizedBox(width: we * 0.2),
                        Center(
                          child: _buildTimePick(true, startTime, (x) {
                            setState(() {
                              startTime = x;
                              print("The picked time is: $x");
                            });
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: he * 0.05),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                  child: Container(
                    color: Colors.white.withOpacity(0.04),
                    // decoration: f4deco,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add your routine ",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 28,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              "(without any skip )",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: he * 0.35,
                          child: !isLoading?(routine.isNotEmpty?SizedBox(
                            height: he * 0.01,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    _buildTimeline(
                                      context,
                                      Theme.of(context)
                                          .primaryColor,
                                    )
                                  ],
                                ),
                                const SizedBox(width: 30),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(
                                            20),
                                        color:
                                        const Color(0xff716d6d)
                                            .withOpacity(0.3),
                                      ),
                                      child: ElevatedButton(
                                        style: b_deco,
                                        onPressed: () {
                                          showModalBottomSheet(
                                            constraints:
                                            BoxConstraints(
                                                maxHeight:
                                                he * 0.75),
                                            isScrollControlled:
                                            true,
                                            enableDrag: true,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    30)),
                                            backgroundColor:
                                            Colors.transparent,
                                            context: context,
                                            builder: (context) =>
                                                ClipRRect(
                                                  borderRadius:
                                                  const BorderRadius
                                                      .vertical(
                                                      top: Radius
                                                          .circular(
                                                          30)),
                                                  child: Stack(
                                                    children: [
                                                      Mytheme.darkapp,
                                                      Add_Routine_Task(
                                                          user: widget
                                                              .user),
                                                    ],
                                                  ),
                                                ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets
                                                  .symmetric(
                                                horizontal: 30,
                                              ),
                                              child: Row(
                                                mainAxisSize:
                                                MainAxisSize
                                                    .max,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .center,
                                                children: [
                                                  SizedBox(
                                                    width: 65,
                                                    height: 65,
                                                    child: Stack(
                                                      children: [
                                                        Center(
                                                          child:
                                                          Container(
                                                            width:
                                                            55,
                                                            height:
                                                            55,
                                                            decoration:
                                                            BoxDecoration(
                                                              shape:
                                                              BoxShape.circle,
                                                              color:
                                                              const Color(0xffd9d9d9).withOpacity(0.2),
                                                            ),
                                                          ),
                                                        ),
                                                        Center(
                                                            child:
                                                            Icon(
                                                              Icons.add,
                                                              color: Theme.of(
                                                                  context)
                                                                  .primaryColor,
                                                              size: 40,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      width: 20),
                                                  const Text(
                                                    "ADD EVENT",
                                                    textAlign:
                                                    TextAlign
                                                        .center,
                                                    style:
                                                    TextStyle(
                                                      color: Colors
                                                          .white,
                                                      fontSize: 16,
                                                      fontFamily:
                                                      "Lato",
                                                      fontWeight:
                                                      FontWeight
                                                          .w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ):SizedBox(
                            height: he * 0.01,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    _buildTimeline(
                                      context,
                                      Theme.of(context)
                                          .primaryColor,
                                    )
                                  ],
                                ),
                                const SizedBox(width: 30),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(
                                            20),
                                        color:
                                        const Color(0xff716d6d)
                                            .withOpacity(0.3),
                                      ),
                                      child: ElevatedButton(
                                        style: b_deco,
                                        onPressed: () {
                                          showModalBottomSheet(
                                            constraints:
                                            BoxConstraints(
                                                maxHeight:
                                                he * 0.75),
                                            isScrollControlled:
                                            true,
                                            enableDrag: true,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    30)),
                                            backgroundColor:
                                            Colors.transparent,
                                            context: context,
                                            builder: (context) =>
                                                ClipRRect(
                                                  borderRadius:
                                                  const BorderRadius
                                                      .vertical(
                                                      top: Radius
                                                          .circular(
                                                          30)),
                                                  child: Stack(
                                                    children: [
                                                      Mytheme.darkapp,
                                                      Add_Routine_Task(
                                                          user: widget
                                                              .user),
                                                    ],
                                                  ),
                                                ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets
                                                  .symmetric(
                                                horizontal: 30,
                                              ),
                                              child: Row(
                                                mainAxisSize:
                                                MainAxisSize
                                                    .max,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .center,
                                                children: [
                                                  SizedBox(
                                                    width: 65,
                                                    height: 65,
                                                    child: Stack(
                                                      children: [
                                                        Center(
                                                          child:
                                                          Container(
                                                            width:
                                                            55,
                                                            height:
                                                            55,
                                                            decoration:
                                                            BoxDecoration(
                                                              shape:
                                                              BoxShape.circle,
                                                              color:
                                                              const Color(0xffd9d9d9).withOpacity(0.2),
                                                            ),
                                                          ),
                                                        ),
                                                        Center(
                                                            child:
                                                            Icon(
                                                              Icons.add,
                                                              color: Theme.of(
                                                                  context)
                                                                  .primaryColor,
                                                              size: 40,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      width: 20),
                                                  const Text(
                                                    "ADD EVENT",
                                                    textAlign:
                                                    TextAlign
                                                        .center,
                                                    style:
                                                    TextStyle(
                                                      color: Colors
                                                          .white,
                                                      fontSize: 16,
                                                      fontFamily:
                                                      "Lato",
                                                      fontWeight:
                                                      FontWeight
                                                          .w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )):const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: b_deco2,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  decoration: f2deco,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 45,
                                    vertical: 15,
                                  ),
                                  child: Text(
                                    "Save",
                                    textAlign: TextAlign.center,
                                    style: tsytle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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

  Widget _buildTimePick(bool ifPickedTime, TimeOfDay currentTime,
      Function(TimeOfDay) onTimePicked) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
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

  Widget _buildTimeline(context, Color tlColor) {
    return SizedBox(
      height: 85,
      width: 30,
      child: TimelineTile(
        hasIndicator: true,
        alignment: TimelineAlign.manual,
        lineXY: 0,
        indicatorStyle: IndicatorStyle(
            padding: const EdgeInsets.all(2),
            indicatorXY: 0,
            width: 16,
            indicator: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(width: 3, color: Theme.of(context).focusColor),
              ),
            )),
        afterLineStyle: LineStyle(
          thickness: 2,
          color: tlColor,
        ),
      ),
    );
  }

  Widget days(String text, TextStyle ts) {
    final f3deco = BoxDecoration(
      shape: BoxShape.circle,

      gradient: LinearGradient(
        colors: [
          Theme.of(context).cardColor,
          Theme.of(context).canvasColor,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
      ),
      // borderRadius: BorderRadius.all(Radius.circular(40)),
    );

    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        children: [
          Center(
            child: Container(
              decoration: f3deco,
              width: 40,
              height: 40,
            ),
          ),
          Center(
              child: Text(
            text,
            style: ts,
          )),
        ],
      ),
    );
  }

  Widget _buildTextField({required String hintText}) {
    return Container(
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          focusColor: Theme.of(context).primaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.6),
                width: 2,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: hintText,
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
  Widget buildDatePicker() =>SizedBox(
    height: 180,
    child: CupertinoDatePicker(
      initialDateTime: dateTime,
      mode: CupertinoDatePickerMode.time,
      onDateTimeChanged: (dateTime) =>
          setState(()=> this.dateTime = dateTime),
    ),
  );
}
