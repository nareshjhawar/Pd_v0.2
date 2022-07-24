import 'dart:developer';
import 'dart:ui';
// import 'package:flutter/services.dart';
import 'package:flutter_todo/data/thems.dart';
import 'package:flutter_todo/pages/detail/widgets/task_timeline.dart';
import 'package:flutter_todo/pages/global_myvar.dart';
import 'package:flutter_todo/pages/myanalytics.dart';
import 'package:flutter_todo/pages/myprofile.dart';
import 'package:flutter_todo/pages/myroutine.dart';
import 'package:flutter_todo/pages/mysettings.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo/pages/note_task.dart';
import 'package:flutter_todo/pages/button_change_them.dart';

import 'package:page_transition/page_transition.dart';
// import 'package:provider/provider.dart';
import '../Animation/fadeAnimation.dart';
import '../curved_nav_bar2.dart';
import '../curved_navigation_bar.dart';
import '../data/shared/Task_saved.dart';
import '../data/tasks.dart';
import '../Animation/linearprogress.dart';
import '../data/time_say.dart';
import '../db/notes_database.dart';
import '../model/note.dart';
import 'button_change_them.dart';
import 'card_tasks.dart';
import '/date_picker_widget.dart';

class MyHomePage extends StatefulWidget {
  VoidCallback opendrawer;
  MyHomePage({required this.opendrawer});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> all_selected_tasks = []; // your tasks
  //pages
  // final PageSettings _settingsmy = const PageSettings();
  // static final List? _widgetOption=[
  //   MyRoutine(opendrawer: () {  },),MyAnalytics(),MyProfile()];


  GlobalKey _bottomNavigationKey = GlobalKey();
  // int selectedIndex = 0 ;

  bool isVisible =true;
  int index = 0;
  final List<Map<String, dynamic>> details = [
    {
      'time': '05:00 AM',
      'title': 'Wake Up time ',
      'slot': 'Within 5 minutes',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
    },
    {
      'time': '05:20 AM',
      'title': 'Top Priority Work ',
      'slot': '05:20 AM - 06:00 AM',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
    },
    {
      'time': '06:00 AM',
      'title': 'Workout ',
      'slot': '06:00 AM - 06:30 AM',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
    },
    {
      'time': '07:00 AM',
      'title': 'Research/ Work',
      'slot': '07:00 AM - 09:00 AM',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
    },
    {
      'time': '09:00 AM',
      'title': 'Rest',
      'slot': '09:00 AM - 09:30 AM',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
    },
    {
      'time': '09:30 AM',
      'title': 'Lunch',
      'slot': '09:30 AM - 10:00 AM',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
    },
    {
      'time': '10:00 AM',
      'title': 'Get Ready',
      'slot': '10:00 AM - 10:30 AM',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
    },
    {
      'time': '10:30 AM',
      'title': 'College Time',
      'slot': '10:30 AM - 03:00 PM',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
      // 'isLast': true
    },
    {
      'time': '03:00 PM',
      'title': 'Library',
      'slot': '03:00 PM - 05:00 PM',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
    },
    {
      'time': '05:00 PM',
      'title': 'Chill Time ',
      'slot': '05:00 PM - 07:00 PM',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
    },
    {
      'time': '07:00 PM',
      'title': 'Get Home & Dinner ',
      'slot': '07:00 PM - 08:00 PM',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
    },
    {
      'time': '08:00 PM',
      'title': 'Get Home & Dinner ',
      'slot': '08:00 PM - 09:00 PM',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
    },
    {
      'time': '09:00 PM',
      'title': 'Other Work/Reading ',
      'slot': '09:00 PM - 10:00 PM',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
    },
    {
      'time': '10:00 PM',
      'title': 'Sleep ',
      'slot': ' ',
      'tlColor': Mytheme.tl_color,
      'bgColor': Mytheme.bg_color,
      'isLast': true
    },
  ];
  List<Note> notes = []; // get info from Database and add to this list

  bool isLoading = false;
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();

  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   all_selected_tasks = TaskerPreference.getString() ?? [];
  //   super.initState();
  //   refreshNote();
  // }
  //
  // @override
  // void dispose() {
  //   // TODO: close Database of Note ...
  //   NotesDatabase.instance.close();
  //   super.dispose();
  // }
  //
  // // Todo for load notd from Database ..
  // Future refreshNote() async {
  //   setState(() => true);
  //   notes = await NotesDatabase.instance.readAllNotes();
  //   setState(() => false);
  // }

  // CurvedNavigationBarState? navBarState;

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: index == 0 ? CurvedNavigationBar(
          key: _bottomNavigationKey,
          backgroundColor: Mytheme.main_bg,
          animationDuration: const Duration(milliseconds: 600),
          // buttonBackgroundColor: Color(0xFF8a75ff),
          index: index,
          // onTap: (index)=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const PageSettings())),
          // height: 75,
          // color: Color(0x4B8D61AA).withOpacity(0.98),
          items:  const [
            Icon(
                Icons.home,
                size: 28,
                color : Colors.white70),

            Icon(
              Icons.settings,
              size: 28,
              color : Colors.white70,
            ),
          ],
          buttonBackgroundColor: Colors.red,
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
              this.index=index;
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
            : CurvedNavigationBar2 (
          key: _bottomNavigationKey,
          backgroundColor:  Mytheme.main_bg,
          animationDuration: const Duration(milliseconds: 600),
          index: index,
          items:  const [
            Icon(
                Icons.home,
                size: 28,
                color : Colors.white70),
            Icon(
                Icons.settings,
                size: 28,
                color : Colors.white70),
            Icon(
                Icons.account_circle_outlined,
                size: 28,
                color : Colors.white70),

            Icon(
              Icons.cable,
              size: 28,
              color : Colors.white70,
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
              this.index=index;
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
      appBar: index ==0 ?AppBar(
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
                    color: Theme.of(context).primaryColor ,
                    size: 32,
                  )
              ),
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
      ): null,

      body: index == 0 ? homeScreen(he, we) :
            index==1? PageSettings() :
            index==2 ? MyRoutine(opendrawer: (){}) :
            index==3 ? MyAnalytics()
                : PageSettings(),
        // body: if (index== 0 ),
        floatingActionButton: index ==0 ?FadeAnimation(
          delay: 1.2,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  // color: Colors.transparent,
                  color : Color(0xff7086e0).withOpacity(0.4),
                  offset: const Offset(-5, 15),
                  spreadRadius: 6,
                  blurRadius: 20,
                ),
              ],
            ),
            height: 65,
            width: 65,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BackdropFilter(
                filter:ImageFilter.blur(sigmaY: 15,sigmaX: 15) ,
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
                    shape: CircleBorder() ,
                    child: Icon (
                      Icons.add,
                      size: 35,
                    ),

                    onPressed: ()  async {
                      Icon(Icons.close,size: 50,);
                    await Navigator.of(context).push(PageTransition(
                        type: PageTransitionType.fade, child: const Note_Task()));
                    // refreshNote();
                  },
                  ),
                ),
              ),
            ),
          ),
        ): null,
    );
  }
  // homescreen
  Widget homeScreen(var he, var we) {
    return SizedBox(
      height: he,
      width: we,
      child: Stack(
        children: [
          Mytheme.darkapp,
          SizedBox(
          // width: we,
          // height: he*0.65,
          child: Column(
            children: [
              FadeAnimation(
                delay: 0.6,
                child: Container(
                  margin: EdgeInsets.only(left: 15,top: he * 0.11,bottom: 2),//0.002
                  width: we * 0.9,
                  height: he * 0.06,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Welcome(),
                    ],
                  ),
                ),
              ),
              FadeAnimation(
                delay: 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: we * 1.7,
                      // height: he * 0.19,
                      height: he * 0.22,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                       physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          return Container(
                            // clipBehavior: Clip.none,
                            margin: const EdgeInsets.only(left: 20,top: 5,bottom: 25),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                              gradient: LinearGradient(
                                colors: [//0xFF5C5292
                                  Theme.of(context).cardColor.withOpacity(0.7),
                                  Theme.of(context).canvasColor.withOpacity(0.7),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomLeft,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).shadowColor,
                                  offset: const Offset(-10,10),
                                  spreadRadius: 1.5,
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Card(
                              color: Colors.transparent,
                              margin: const EdgeInsets.only(left: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              // shadowColor: Colors.pinkAccent,
                              child: Container(
                                width: we * 0.85,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    top: 25,
                                    left: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Insert tasks",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                            color: Mytheme.text_1.withOpacity(0.7)),
                                      ),
                                      SizedBox(
                                        height: he * 0.01,
                                      ),
                                      Text(
                                        tasklist[i].title,
                                        style: TextStyle(
                                          fontSize: 35,
                                          color: Mytheme.text_1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: he * 0.04),
                                      Padding(
                                          padding: const EdgeInsets.only(right: 30),
                                          child: LineProgress(
                                            value: notes.length.toDouble(),
                                            Color: tasklist[i].progresscolor,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: tasklist.length,
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: he * 0.0,
              // ),

              // //imp list ***
              ClipRRect(
                // clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 120, sigmaX: 120),
                  child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: const Radius.circular(20),
                        topLeft: const Radius.circular(20),
                    ) ,
                  ),
                  child: Column(
                    children: [
                      FadeAnimation(
                        delay: 1.0,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 30,top:5,bottom: 0),
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
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Theme.of(context).primaryColor,
                                    size: 30,
                                  )
                              ),
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
                      width: we*0.155,
                      height:he*0.125,
                      // height: 60,
                      // deactivatedColor: Mytheme.prime_color2,
                      controller: _controller,

                      initialSelectedDate: DateTime.now(),
                      // selectionColor: Mytheme.prime_color2,

                      selectedTextColor: Colors.white.withOpacity(0.97),
                      dateTextStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: Mytheme.date_color),
                      dayTextStyle: const TextStyle(fontSize: 13,
                          color: Mytheme.date_color),
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
                        delay: 1.4,
                        child: Container(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 5,left: 30,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:[ Text(
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
                                  onPressed: (){
                                    setState((){
                                      isVisible =!isVisible;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Theme.of(context).primaryColor,
                                    size: 30,
                                  )
                              ),
                            ]
                          ),
                        ),
                      ),
                      FadeAnimation(
                        delay: 1.5,
                        child: Visibility(
                          visible: isVisible,
                          child: SizedBox(
                          width: we,
                          height: he*0.35,
                          child: details != null
                              ? SingleChildScrollView(
                            padding: EdgeInsets.only(left: 15,top: he*0.16,bottom: 0),//error flex top
                                child: Center(
                            heightFactor: 0.65,
                                  child: FadeAnimation(
                                    delay: 0.3,
                                    child: ListView.builder(
                                      // clipBehavior: Clip.none,
                                          physics: const NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: details.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return TaskTimeline(
                                              detail: details.elementAt(index),
                                            );
                                          }),
                                  ),

                                ),
                              )
                              : Container(
                            margin: const EdgeInsets.only(left: 30, top: 30),
                            child: const Text(
                              "No Tasks",
                              style: TextStyle(
                                fontSize: 20,
                                color: Mytheme.primary_color,
                              ),
                            ),
                          ),
                    ),
                        ),
                      ),]
                  ),
                  ),
                ),
              ),

              //old list extra

              // FadeAnimation(
              //     delay: 1,
              //     child: SizedBox(
              //         width: we * 0.9,
              //         height: he * 0.23,
              //         child: isLoading
              //             ? const CircularProgressIndicator()
              //             : notes.isEmpty
              //                 ? Container(
              //                     margin:
              //                         const EdgeInsets.only(left: 130, top: 120),
              //                     child: Text("No Tasks",
              //                         style: TextStyle(
              //                           fontSize: 20,
              //                           color: Theme.of(context).primaryColor,
              //                         )))
              //                 : ListView(
              //                    physics: const BouncingScrollPhysics(),
              //                     children: notes.map((note) {
              //                     final IsSelected = all_selected_tasks
              //                         .contains(note.description);
              //
              //                     return Slidable(
              //                         endActionPane: ActionPane(
              //                           // A motion is a widget used to control how the pane animates.
              //                           motion: const StretchMotion(),
              //
              //                           // A pane can dismiss the Slidable.
              //
              //                           // All actions are defined in the children parameter.
              //                           children: [
              //                             // A SlidableAction can have an icon and/or a label.
              //                             SlidableAction(
              //                               onPressed: (context) async {
              //                                 NotesDatabase.instance
              //                                     .delete(note.id!);
              //                                 refreshNote();
              //                               },
              //                               backgroundColor: Color(0xFFFE4A49),
              //                               foregroundColor: Colors.white,
              //                               icon: Icons.delete,
              //                               label: "Delete",
              //                             ),
              //                             SlidableAction(
              //                               onPressed: (context) async {
              //                                 await Navigator.of(context).push(
              //                                     MaterialPageRoute(
              //                                         builder: (context) =>
              //                                             Note_Task(
              //                                               note: note,
              //                                             )));
              //                                 refreshNote();
              //                               },
              //                               backgroundColor: const Color(0xFF21B7CA),
              //                               foregroundColor: Colors.white,
              //                               label: "Edit",
              //                               icon: Icons.edit,
              //                             ),
              //                           ],
              //                         ),
              //                         child: builditem(note, IsSelected));
              //                   }).toList()))),
            ],
          ),
        ),
      ]),
    );
  }

//   // TODO : Tasks Items ...
//   Widget builditem(Note item, IsSelected) {
//     return CardTasks(
//       Index: item.id!,
//       onSelected: (tasks) async {
//         setState(() {
//           IsSelected
//               ? all_selected_tasks.remove(item.description)
//               : all_selected_tasks.add(item.description);
//         });
//         TaskerPreference.setStringList(all_selected_tasks);
//       },
//       isActive: IsSelected,
//       taskuser: item,
//     );
//   }
}
