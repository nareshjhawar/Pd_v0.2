import 'dart:developer';
import 'dart:ui';
import 'package:flutter_todo/pages/detail/widgets/task_timeline.dart';
import 'package:flutter_todo/pages/mysettings.dart';

// import 'package:flutter_todo/constants.dart';
import 'package:glass/glass.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo/pages/note_task.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:provider/provider.dart';
import '../Animation/fadeAnimation.dart';
import '../curved_navigation_bar.dart';
import '../data/shared/Task_saved.dart';
import '../data/tasks.dart';
import '../Animation/linearprogress.dart';
import '../data/time_say.dart';
import '../db/notes_database.dart';
import '../extra/Values/values.dart';
import '../extra/darkRadialBackground.dart';
import '../model/note.dart';
import 'button_change_them.dart';
import 'card_tasks.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';


class MyHomePage extends StatefulWidget {
  VoidCallback opendrawer;
  MyHomePage({required this.opendrawer});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> all_selected_tasks = []; // your tasks
  //pages
  int pageIndex = 0 ;
  final PageSettings _settingsmy = PageSettings();
  // final My1HomePage _home = My1HomePage();
  

  final List<Map<String, dynamic>> details = [
    {
      'time': '07:00 AM',
      'title': 'Wake Up time ',
      'slot': '07:00 AM - 07:10 AM',
      'tlColor': Colors.deepPurple.shade200,
      'bgColor': Colors.deepPurple.shade400,
    },
    {
      'time': '08:00 AM',
      'title': 'Workout',
      'slot': '08:00 AM - 09:00 AM',
      'tlColor': Colors.deepPurple.shade200,
      'bgColor': Colors.deepPurple.shade400,
    },
    {
      'time': '09:00 AM',
      'title': 'Rest',
      'slot': '09:00 AM - 09:30 AM',
      'tlColor': Colors.deepPurple.shade200,
      'bgColor': Colors.deepPurple.shade400,
    },
    {
      'time': '09:30 AM',
      'title': 'Lunch',
      'slot': '09:30 AM - 10:00 AM',
      'tlColor': Colors.deepPurple.shade200,
      'bgColor': Colors.deepPurple.shade400,
    },
    {
      'time': '10:00 AM',
      'title': 'Get Ready',
      'slot': '10:00 AM - 10:30 AM',
      'tlColor': Colors.deepPurple.shade200,
      'bgColor': Colors.deepPurple.shade400,
    },
    {
      'time': '10:30 AM',
      'title': 'College Time',
      'slot': '10:30 AM - 03:00 PM',
      'tlColor': Colors.deepPurple.shade200,
      'bgColor': Colors.deepPurple.shade400,
      // 'isLast': true
    },
  ];
  List<Note> notes = []; // get info from Database and add to this list

  bool isLoading = false;
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    all_selected_tasks = TaskerPreference.getString() ?? [];
    super.initState();
    refreshNote();
  }

  @override
  void dispose() {
    // TODO: close Database of Note ...
    NotesDatabase.instance.close();
    super.dispose();
  }

  // Todo for load notd from Database ..
  Future refreshNote() async {
    setState(() => true);
    notes = await NotesDatabase.instance.readAllNotes();
    setState(() => false);
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;

    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      // backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 600),
          // buttonBackgroundColor: Color(0xFF8a75ff),
          index: 0,
          // height: 75,
          // color: Color(0x4B8D61AA).withOpacity(0.98),
          items: const [
            Icon(
                Icons.home,
                size: 32,
                color : Colors.white70),
            // Padding(
            //     padding: EdgeInsets.only(bottom: 15,),
            //     child: Icon(null,size: 28,)),

            Icon(
              Icons.settings,
              size: 32,
              color : Colors.white70,
            ),
          ],
          buttonBackgroundGradient: LinearGradient(
            colors: [
              Color(0xFF8147EF).withOpacity(0.3),
              Color(0xFF6A88E5).withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
// Color(0xFFC296E8)
          gradient: LinearGradient(
            colors: [
              // Color(0xFF685AB4).withOpacity(0.7),
              // // Colors.transparent.withOpacity(0.8),
              // Color(0xFF726AE5),//0xFF726AE5
              Color(0xFF7D8EDB).withOpacity(0.7),
              Color(0xFF5A5694),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          ),
        ),
      appBar: AppBar(
        elevation:0,
        backgroundColor: Colors.transparent,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: widget.opendrawer,
                  icon: const Icon(
                    Icons.drag_handle_rounded,
                    color: Colors.grey,
                    size: 35,
                  )
              ),
              SizedBox(
                width: we * 0.42,
              ),

              // const Text(
              //   "PRODO",
              //   style: TextStyle(
              //       letterSpacing: 2,
              //       color: Constants.kBlueColor,
              //       fontWeight: FontWeight.w600,
              //       // fontSize: 13),
              //       fontSize: 16),
              // ),
              SizedBox(
                width: we * 0.3,
              ),

              // SizedBox(
              //   width: we * 0.01,
              // ),
              ChangeThembutton()
            ],
          )
        ],
      ),

      body: SizedBox(
        height: he,
        width: we,
        child: Stack(
          children: [
            // LightRadialBackground(
            //   color1: HexColor.fromHex("#d4cef0"),
            //   position1: "topLeft",
            // ),

            DarkRadialBackground(
              color: HexColor.fromHex("#181a1f"),
              position: "topLeft",
            ),

            SizedBox(
            // width: we,
            // height: he*0.65,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FadeAnimation(
                    delay: 0.6,
                    child: Container(
                      margin: EdgeInsets.only(left: 15,top: he * 0.12,bottom: 10),//0.002
                      width: we * 0.9,
                      height: he * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Welcome(),
                          SizedBox(
                            height: he * 0.02,
                          ),
                          Text(
                            "MODES",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                                // fontSize: 13),
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FadeAnimation(
                    delay: 0.9,
                    child: SizedBox(
                      width: we * 1.7,
                      height: he * 0.19,
                      // height: he * 0.16,
                      child: ListView.builder(

                       physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          return Card(
                            color: Colors.white12.withOpacity(0.02),

                            margin: const EdgeInsets.only(left: 23),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            clipBehavior: Clip.antiAlias,
                            elevation: 3,
                            // shadowColor: Colors.pinkAccent,
                            child: Container(
                              width: we * 0.8,
                              // width: we * 0.5,
                              height: he * 0.06,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [//0xFF5C5292
                                    Color(0xFF5C5292).withOpacity(0.7),
                                    Color(0xFF6A88E5).withOpacity(0.7),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.deepPurple.withOpacity(0.4),
                                //     offset: const Offset(8, 16),
                                //     blurRadius: 16,
                                //   ),
                                // ],
                              ),
                              // margin: const EdgeInsets.only(
                              //   top: 25,
                              //   left: 14,
                              // ),
                              child: Container(
                          margin: const EdgeInsets.only(
                            top: 25,
                            left: 18,
                          ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Insert tasks",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                          color: Colors.white.withOpacity(0.7)),
                                    ),
                                    SizedBox(
                                      height: he * 0.01,
                                    ),
                                    Text(
                                      tasklist[i].title,
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white.withOpacity(0.9),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: he * 0.05),
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
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: tasklist.length,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: he * 0.02,
                  ),

                  FadeAnimation(
                    delay: 1.4,
                    child: Container(
                      color: Color(0xFF5C5292).withOpacity(0.1),
                      margin: const EdgeInsets.only(left: 0, bottom: 0),
                      child: Container(
                        margin: const EdgeInsets.only(left: 15,top:5,bottom: 5,right: 15),
                        child: DatePicker(
                          DateTime.now(),
                          dayTextStyle: const TextStyle(fontSize: 12,color: Colors.white70),
                          monthTextStyle: const TextStyle(fontSize: 12,color: Colors.white70),
                          dateTextStyle: const TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Color(0xFFA481F5)),
                          width: 60,
                          height: 80,
                          deactivatedColor: Colors.white,
                          controller: _controller,

                          initialSelectedDate: DateTime.now(),
                          selectionColor: Color(0xFF5C5292).withOpacity(0.9),

                          selectedTextColor: Colors.white,
                          // inactiveDates: [
                          //   DateTime.now().add(Duration(days: 7)),
                          //   DateTime.now().add(Duration(days: 8)),
                          // ],
                          onDateChange: (date) {

                            // New date selected
                            setState(() {
                              _selectedValue = date;
                            });
                          },
                        ),
                      ),
                    ).asGlass(frosted: false,tintColor: Colors.transparent),
                  ),
                  // SizedBox(
                  //   height: he * 0.02,
                  // ),
                  FadeAnimation(
                    delay: 1.8,
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 15, bottom:5,left: 20),
                      child: Text(
                        "TODAY'S ROUTINE",
                        style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70.withOpacity(0.6),
                            fontSize: 16),
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.only(left: 30,right: 30,bottom: 0),
                  //   child: Divider(
                  //     thickness: 1.5,
                  //     color: Color(0xFF9676DE),
                  //   ),
                  // ),
                  // //imp list ***
                  FadeAnimation(
                    delay: 2.8,
                    child: SizedBox(
                      width: we,
                      height: he*0.35,
                      child: details != null
                          ? SingleChildScrollView(
                        padding: EdgeInsets.only(top: 10,bottom: 20),
                            child: Center(
                        heightFactor: 0.68,
                              child: ListView.builder(
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
                          )
                          : Container(
                        margin: const EdgeInsets.only(left: 30, top: 30),
                        child: Text(
                          "No Tasks",
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
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
          ),
        ]),
      ),
        floatingActionButton: FadeAnimation(
          delay: 1.4,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent.withOpacity(0.1),
            // hoverElevation: 0.5,
            child: Container(
              // color: Colors.transparent,
              width: 95,
              height: 95,
              child: const Icon(
                Icons.add,
                size: 36,
              ),
              decoration: BoxDecoration(
                // color: Colors.transparent,
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.shade400.withOpacity(0.5),
                    const Color(0xFF6A88E5).withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF6A88E5),
                    offset: Offset(15, 15),
                    blurRadius: 16,
                  ),
                ],
              ),
            ).asGlass(
              frosted:false,clipBorderRadius: BorderRadius.circular(27),),

            onPressed: () async {
            await Navigator.of(context).push(PageTransition(
                type: PageTransitionType.fade, child: const Note_Task()));
            refreshNote();
          },
          ),
        )
    );
  }


  // TODO : Tasks Items ...
  Widget builditem(Note item, IsSelected) {
    return CardTasks(
      Index: item.id!,
      onSelected: (tasks) async {
        setState(() {
          IsSelected
              ? all_selected_tasks.remove(item.description)
              : all_selected_tasks.add(item.description);
        });
        TaskerPreference.setStringList(all_selected_tasks);
      },
      isActive: IsSelected,
      taskuser: item,
    );
  }
}
