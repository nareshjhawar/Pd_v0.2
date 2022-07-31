import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_todo/Animation/fadeAnimation.dart';
import 'package:flutter_todo/data/thems.dart';
import 'package:flutter_todo/db/notes_database.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/note.dart';

class Note_Task extends StatefulWidget {
  final Note? note;

  const Note_Task({Key? key, this.note}) : super(key: key);

  @override
  _Note_TaskState createState() => _Note_TaskState();
}

class _Note_TaskState extends State<Note_Task> {
  late String description;
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();


  bool Ison = false;

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // time = widget.note?.time ?? '';
    description = widget.note?.description ?? ''; // for get null or value
    // slot = widget.note?.slot ?? '';
  }

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


    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: he*0.02,),
            SizedBox(
              height: he*0.1,
              child: Column(
                children: [
                  Center(child: Text("Add Task",style: tsytle,)),
                  SizedBox(height: he*0.005,),
                  Center(child: Text("(Day Specific)",style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                  ),)),

                ],
              ),
            ),
            SizedBox(
              height: he*0.63,
              child: SingleChildScrollView(
                child: Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children :[
                                // title
                                _buildTextField(hintText: 'Title'),

                                SizedBox(height: he*0.02,),
                                // note
                                _buildTextField(hintText: 'Note'),
                                SizedBox(height: he*0.02,),
                                // date
                                _buildTextField(hintText: 'Date'),
                                SizedBox(height: he*0.02,),
                                // time
                                // reminder
                                _buildTextField(hintText: 'Reminder'),
                                SizedBox(height: he*0.02,),
                                Text('Time',style: tsytle1,),
                                SizedBox(height: he*0.02,),

                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildTimePick( true, startTime, (x) {
                                      setState(() {
                                        startTime = x;
                                        print("The picked time is: $x");
                                      });
                                    }),
                                     // SizedBox(width: we*0.08),
                                    _buildTimePick( true, endTime, (x) {
                                      setState(() {
                                        endTime = x;
                                        print("The picked time is: $x");
                                      });
                                    }),
                                  ],
                                ),

                                SizedBox(height: he*0.02,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(
                                    "Tags",
                                    style: tsytle1,
                                  ),
                                    SizedBox(height: he*0.02,),
                                    Container(
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
                                    SizedBox(height: he*0.02,),

                                    Text(
                                    "+ Add new tag",
                                    style: tsytle1,
                                  ),
                                    SizedBox(height: he*0.1,)
                                ],),
                                //button
                              ]
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: he*0.06),
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 65,
            height: 65,
            decoration: f2deco,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon:  Icon(
                  Icons.check_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                )
            ),
          ),
        ),
      ],
    );
  }
  // Widget task_screen(var he, var we){
  //   final tsytle = TextStyle(
  //     color: Theme.of(context).primaryColor,
  //     fontSize: 30,
  //     fontWeight: FontWeight.w700,
  //   );
  //   final tsytle1 = TextStyle(
  //     color: Theme.of(context).primaryColor,
  //     fontSize: 20,
  //     fontWeight: FontWeight.w500,
  //   );
  //   final f2deco = BoxDecoration(
  //     gradient: LinearGradient(
  //       colors: [//0xFF5C5292
  //         Theme.of(context).cardColor.withOpacity(0.7),
  //         Theme.of(context).canvasColor.withOpacity(0.7),
  //       ],
  //       begin: Alignment.topCenter,
  //       end: Alignment.bottomLeft,
  //     ),
  //     borderRadius: BorderRadius.all(Radius.circular(30)),
  //   ) ;
  //   return Container(
  //     padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Center(child: Text("Add Task",style: tsytle,)),
  //         SizedBox(height: he*0.02,),
  //         Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children :[
  //               // title
  //               TextField(
  //                 controller: nameController,
  //                 decoration: InputDecoration(
  //                   focusColor: Theme.of(context).primaryColor,
  //                   focusedBorder: OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color:Theme.of(context).primaryColor,width: 2,style: BorderStyle.solid
  //                     ),
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   enabledBorder: OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color: Theme.of(context).primaryColor.withOpacity(0.6),width: 2,style: BorderStyle.solid
  //                     ),
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   labelText: 'Title',
  //                   labelStyle: TextStyle(
  //                       color: Theme.of(context).primaryColor
  //                   ),
  //                 ),),
  //
  //               SizedBox(height: he*0.02,),
  //               // note
  //               TextField(
  //                 controller: nameController,
  //                 decoration: InputDecoration(
  //                   focusColor: Theme.of(context).primaryColor,
  //                   focusedBorder: OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color:Theme.of(context).primaryColor,width: 2,style: BorderStyle.solid
  //                     ),
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   enabledBorder: OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color: Theme.of(context).primaryColor.withOpacity(0.6),width: 2,style: BorderStyle.solid
  //                     ),
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   labelText: 'Note',
  //                   labelStyle: TextStyle(
  //                       color: Theme.of(context).primaryColor
  //                   ),
  //                 ),),
  //               SizedBox(height: he*0.02,),
  //               // note
  //               TextField(
  //                 controller: nameController,
  //                 decoration: InputDecoration(
  //                   focusColor: Theme.of(context).primaryColor,
  //                   focusedBorder: OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color:Theme.of(context).primaryColor,width: 2,style: BorderStyle.solid
  //                     ),
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   enabledBorder: OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color: Theme.of(context).primaryColor.withOpacity(0.6),width: 2,style: BorderStyle.solid
  //                     ),
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   labelText: 'Date',
  //                   labelStyle: TextStyle(
  //                       color: Theme.of(context).primaryColor
  //                   ),
  //                 ),),
  //               SizedBox(height: he*0.02,),
  //               // time
  //               // reminder
  //               TextField(
  //                 controller: nameController,
  //                 decoration: InputDecoration(
  //                   focusColor: Theme.of(context).primaryColor,
  //                   focusedBorder: OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color:Theme.of(context).primaryColor,width: 2,style: BorderStyle.solid
  //                     ),
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   enabledBorder: OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color: Theme.of(context).primaryColor.withOpacity(0.6),width: 2,style: BorderStyle.solid
  //                     ),
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   labelText: 'Reminder',
  //                   labelStyle: TextStyle(
  //                       color: Theme.of(context).primaryColor
  //                   ),
  //                 ),),
  //               SizedBox(height: he*0.02,),
  //               // button
  //               Center(
  //                 child: Container(
  //                   margin: EdgeInsets.only(top: he * 0.04,),
  //                   width: 55,
  //                   height: 55,
  //                   alignment: Alignment.center,
  //                   decoration: f2deco,
  //                   child: IconButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pop();
  //                       },
  //                       icon: Icon(
  //                         Icons.add_rounded,
  //                         color: Theme.of(context).primaryColor,
  //                         size: 30,
  //                       )
  //                   ),
  //                 ),
  //               ),
  //               Center(
  //                 child: Container(
  //                   margin: EdgeInsets.only(top: he * 0.04,),
  //                   width: 55,
  //                   height: 55,
  //                   alignment: Alignment.center,
  //                   decoration: f2deco,
  //                   child: IconButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pop();
  //                       },
  //                       icon:  Icon(
  //                         Icons.close,
  //                         color: Theme.of(context).primaryColor,
  //                         size: 25,
  //                       )
  //                   ),
  //                 ),
  //               ),
  //           ]
  //         ),
  //       ],
  //     ),
  //   );
  // }
  // TODO Update button ...

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

  Widget _buildButtonCreate(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Mytheme.darkapp,
        Container(
          width: we * 0.16,
          height: 50,
          // margin: EdgeInsets.only(left: we * 0.45),
          decoration: BoxDecoration(
            // color: Colors.transparent,
            gradient: LinearGradient(
              colors: [
                Mytheme.fbutton1,
                Mytheme.fbutton2,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Mytheme.fbutton3.withOpacity(0.4),
                offset: Offset(-5, 10),
                spreadRadius: 6,
                blurRadius: 20,
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ElevatedButton(
                onPressed: addNote,
                clipBehavior: Clip.none,
                style: ElevatedButton.styleFrom(
                    primary: Mytheme.prime_color2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                ),
                child: const Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                )
            ),
          ),
        ),
      ],
    );
  }

  // TODO Save button ..
  Widget _buildButtonSave(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      width: we * 0.4,
      height: 50,
      margin: EdgeInsets.only(left: we * 0.45),
      child: ElevatedButton(
          onPressed: null,
          child: Text(
            "Save",
            style: GoogleFonts.lato(color: Colors.white),
          )),
    );
  }

  // Todo add note in db
  Future addNote() async {
    final note = Note(description: description, );
    if (description.isNotEmpty) {
      // TODO null text
      await NotesDatabase.instance.create(note);
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
    }
  }

  // Todo update note in db
  Future updateNote() async {
    final note = widget.note!.copy(description: description);
    await NotesDatabase.instance.update(note);
    Ison = true;
    Navigator.of(context).pop();
  }
}
