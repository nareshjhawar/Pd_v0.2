import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Animation/fadeAnimation.dart';
import '../Utils/Widgets.dart';
import '../Utils/thems.dart';
import '../Widgets/button_change_them.dart';
import '../Widgets/charts/bar_chart_page.dart';
import '../Widgets/curved_nav_bar/curved_navigation_bar.dart';
import '../Widgets/date_picker/date_picker_widget.dart';
import '../Widgets/timeline/task_timeline1.dart';
import '../data/data_model.dart';
import 'Analytics.dart';
import 'BottomSheets/DayTask.dart';
import 'Profile.dart';
import 'SetRoutine.dart';
import 'Settings.dart';


class MyHomePage extends StatefulWidget {
  VoidCallback opendrawer;
  User user;

  MyHomePage({required this.opendrawer, required this.user});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  bool isSwitched = false;
  bool isVisible = false;
  int index = 0;

  List<TaskModel> routine=[];

  bool isLoading = false;
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
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
        // print(task.startTime);
        routine.add(task);
      }// [{},{}],{{},{}}
      setState(() {});
    } catch (e) {
      print('error: \n\n $e \n\n');
      Fluttertoast.showToast(msg: 'error in getting data');
    }
    setState(() {
      isLoading = false;
    });
  }

  bool ischart = false;

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: index == 0
          ? CurvedNavigationBar(
              key: _bottomNavigationKey,
              backgroundColor: Mytheme.main_bg,
              animationDuration: const Duration(milliseconds: 600),
              // buttonBackgroundColor: Color(0xFF8a75ff),
              index: index,
              // onTap: (index)=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const PageSettings())),
              // height: 75,
              // color: Color(0x4B8D61AA).withOpacity(0.98),
              items: const [
                Icon(Icons.home, size: 28, color: Colors.white70),
                Icon(
                  Icons.settings,
                  size: 28,
                  color: Colors.white70,
                ),
              ],
              // buttonBackgroundColor: Colors.red,
              buttonBackgroundGradient: LinearGradient(
                colors: [
                  // Mytheme.nav_button_color1.withOpacity(0.6),
                  // Mytheme.nav_button_color2.withOpacity(0.4),
                  Theme.of(context).cardColor,
                  Theme.of(context).canvasColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onTap: (index) {
                setState(() {
                  this.index = index;
                });
              },
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).cardColor.withOpacity(0.1),
                  Theme.of(context).canvasColor.withOpacity(0.1),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              ),
            )
          : CurvedNavigationBar2(
              key: _bottomNavigationKey,
              backgroundColor: Mytheme.main_bg,
              animationDuration: const Duration(milliseconds: 600),
              index: index,
              items: const [
                Icon(Icons.home, size: 28, color: Colors.white70),
                Icon(Icons.settings, size: 28, color: Colors.white70),
                Icon(Icons.account_circle_outlined,
                    size: 28, color: Colors.white70),
                Icon(
                  Icons.cable,
                  size: 28,
                  color: Colors.white70,
                ),
              ],
              // buttonBackgroundColor: Colors.red,
              buttonBackgroundGradient: LinearGradient(
                colors: [
                  Theme.of(context).cardColor,
                  Theme.of(context).canvasColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onTap: (index) {
                setState(() {
                  this.index = index;
                });
              },
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).cardColor.withOpacity(0.1),
                  Theme.of(context).canvasColor.withOpacity(0.1),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              ),
            ),
      appBar: index == 0
          ? AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: widget.opendrawer,
                        icon: Icon(
                          Icons.bar_chart_rounded,
                          color: Theme.of(context).primaryColor,
                          size: 32,
                        )),
                    SizedBox(
                      width: we * 0.42,
                    ),

                    SizedBox(
                      width: we * 0.3,
                    ),
                    // ScaleTransition(child: ChangeThembutton())
                    ChangeThembutton()
                  ],
                )
              ],
            )
          : null,
      body: index == 0
          ? homeScreen(he, we)
          : index == 1
              ? const PageSettings()
              : index == 2
                  ? const MyProfile()
                  : index == 3
                      ? const MyAnalytics()
                      : const PageSettings(),
      floatingActionButton: index == 0
          ? FadeAnimation(
              delay: 0.9,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      // color: Colors.transparent,
                      color: const Color(0xff7086e0).withOpacity(0.3),
                      offset: const Offset(-5, 15),
                      spreadRadius: 1,
                      blurRadius: 20,
                    ),
                  ],
                ),
                height: 65,
                width: 65,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).cardColor.withOpacity(0.6),
                            Theme.of(context).canvasColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      child: FloatingActionButton(
                        clipBehavior: Clip.none,
                        backgroundColor: Colors.transparent,
                        elevation: 20,
                        // materialTapTargetSize: Ma,
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.add,
                          size: 35,
                        ),
                        onPressed: () => showModalBottomSheet(
                          constraints: BoxConstraints(maxHeight: he * 0.75),
                          isScrollControlled: true,
                          enableDrag: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(30)),
                            child: Stack(
                              children: [
                                Mytheme.darkapp,
                                const Note_Task(),
                              ],
                            ),
                          ),

                        ), // modalsheet

                      ),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }

  // homescreen
  Widget homeScreen(var he, var we) {
    return SizedBox(
      height: he,
      width: we,
      child: Stack(children: [
        Mytheme.darkapp,
        Column(
          children: [
            SizedBox(
              height: he * 0.35,
              child: Column(
                children: [
                  //welcome text
                  FadeAnimation(
                    delay: 0.5,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 30, top: he * 0.12), //0.002
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back 👋",
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //cardstack
                  FadeAnimation(
                    delay: 1.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: he * 0.16,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  clipBehavior: Clip.none,
                                  margin: const EdgeInsets.only(
                                      left: 25, top: 10, bottom: 10),
                                  decoration: GlobalDeco(context),
                                  child: ElevatedButton(
                                    style: b_deco1,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Set_Routine(user: widget.user,),
                                          ));
                                    },
                                    child: Container(

                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20,
                                          horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Insert tasks",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Mytheme.text_1
                                                    .withOpacity(0.7)),
                                          ),
                                          SizedBox(
                                            height: he * 0.01,
                                          ),
                                          Text(
                                            "Set Mode"+' '*0,
                                            style: TextStyle(
                                              fontSize: 32,
                                              color: Mytheme.text_1,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  clipBehavior: Clip.none,
                                  margin: const EdgeInsets.only(
                                      left: 25, top: 10, bottom: 10),
                                  decoration: GlobalDeco(context),
                                  child: ElevatedButton(
                                    style: b_deco1,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) { return Container(); } ,
                                          ));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20,
                                          horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Insert tasks",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Mytheme.text_1
                                                    .withOpacity(0.7)),
                                          ),
                                          SizedBox(
                                            height: he * 0.01,
                                          ),
                                          Text(
                                            "Analyze"+' '*2,
                                            style: TextStyle(
                                              fontSize: 32,
                                              color: Mytheme.text_1,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                height: he * 0.65,
                child: SingleChildScrollView(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 80, sigmaX: 80),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: const Radius.circular(20),
                            topLeft: const Radius.circular(20),
                          ),
                        ),
                        child: Column(children: [
                          FadeAnimation(
                            delay: 0.5,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 30, top: 5, bottom: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Calendar",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  SizedBox(
                                    width: we * 0.55,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isVisible = !isVisible;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Theme.of(context).primaryColor,
                                        size: 30,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          FadeAnimation(
                            delay: 1.2,
                            child: Container(
                              clipBehavior: Clip.none,
                              // margin: const EdgeInsets.only(
                              //     left: 0,top:0,bottom: 0,right: 0),
                              child: DatePicker(
                                DateTime.now(),
                                daysCount: 14,
                                width: we * 0.155,
                                height: he * 0.125,
                                // height: 60,
                                // deactivatedColor: Mytheme.prime_color2,
                                controller: _controller,

                                initialSelectedDate: DateTime.now(),
                                // selectionColor: Mytheme.prime_color2,

                                selectedTextColor:
                                    Colors.white.withOpacity(0.97),
                                dateTextStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 26,
                                    color: Mytheme.date_color),
                                dayTextStyle: const TextStyle(
                                    fontSize: 13, color: Mytheme.date_color),
                                // monthTextStyle: const TextStyle(fontSize: 12,
                                //     color: Mytheme.main_bg),

                                // activeDates: [
                                //   DateTime.now().add(Duration(days: 0)),
                                //   DateTime.now().add(Duration(days: 1)),
                                // ],
                                onDateChange: (date) {
                                  // New date selected
                                  setState(() {
                                    _selectedValue = date;
                                  });
                                },
                              ),
                            ),
                          ),
                          FadeAnimation(
                            delay: 0.8,
                            child: Container(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(
                                top: 5,
                                left: 30,
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Today's Routine",
                                      style: TextStyle(
                                          letterSpacing: 0.2,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 17.5),
                                    ),
                                    SizedBox(
                                      width: we * 0.4,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isVisible = !isVisible;
                                            ischart = !ischart;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Theme.of(context).primaryColor,
                                          size: 30,
                                        )),
                                  ]),
                            ),
                          ),
                          FadeAnimation(
                            delay: 1.0,
                            child: Column(
                              children: [
                                Visibility(
                                  visible: isVisible,
                                  child: !isLoading
                                      ? (routine.isNotEmpty
                                          ? SingleChildScrollView(
                                              padding: EdgeInsets.only(
                                                  left: 15,
                                                  top: he * 0.17,
                                                  bottom: he * 0.25),
                                              child: Center(
                                                heightFactor: 0.65,
                                                child: ListView.builder(
                                                    // clipBehavior: Clip.none,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    shrinkWrap: true,
                                                    itemCount: routine.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return TaskTimeline(
                                                        taskModel: routine
                                                            .elementAt(index),
                                                      );
                                                    }),
                                              ),
                                            )
                                          : Container(
                                              margin: const EdgeInsets.only(
                                                  left: 30, top: 30),
                                              child: const Text(
                                                "No Tasks",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Mytheme.primary_color,
                                                ),
                                              ),
                                            ))
                                      : const CircularProgressIndicator(),
                                ),
                                Column(
                                  children: [
                                    const BarChartPage(),
                                    SizedBox(
                                      height: he * 0.1,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
