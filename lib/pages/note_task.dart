import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_todo/Animation/fadeAnimation.dart';
import 'package:flutter_todo/data/thems.dart';
import 'package:flutter_todo/db/notes_database.dart';
import 'package:flutter_todo/pages/note_form.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/note.dart';
// import 'dart:html';

class Note_Task extends StatefulWidget {
  final Note? note;

  const Note_Task({Key? key, this.note}) : super(key: key);

  @override
  _Note_TaskState createState() => _Note_TaskState();
}

class _Note_TaskState extends State<Note_Task> {
  // late String time;
  late String description;
  // late String slot;


  bool Ison = false;
  final _controller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  // get nameController => null;
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
          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Add Task",style: tsytle,)),
              SizedBox(height: he*0.005,),
              Center(child: Text("(Day Specific)",style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
              ),)),

              SizedBox(height: he*0.04,),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children :[
                    // title
                    TextField(
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
                        labelText: 'Title',
                        labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor
                        ),
                      ),),

                    SizedBox(height: he*0.02,),
                    // note
                    TextField(
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
                        labelText: 'Note',
                        labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor
                        ),
                      ),),
                    SizedBox(height: he*0.02,),
                    // note
                    TextField(
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
                        labelText: 'Date',
                        labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor
                        ),
                      ),),
                    SizedBox(height: he*0.02,),
                    // time
                    // reminder
                    TextField(
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
                        labelText: 'Reminder',
                        labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor
                        ),
                      ),),

                    SizedBox(height: he*0.1,),

                    //button
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: he * 0.04,),
                        width: 65,
                        height: 65,
                        alignment: Alignment.center,
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
                  ]
              ),
            ],
          ),
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
