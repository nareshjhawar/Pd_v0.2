import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_todo/Animation/fadeAnimation.dart';
import 'package:flutter_todo/data/thems.dart';
import 'package:flutter_todo/db/notes_database.dart';
import 'package:flutter_todo/pages/note_form.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/note.dart';

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

    return ClipRRect(

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 40,sigmaX: 40),

        child: Scaffold(
          // extendBody: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              child: Column(
                children: [

                  FadeAnimation(
                      delay: 0.3,
                      child: NoteFormWidget(
                        // time: time,
                        // onChangedtime: (time) {
                        //   setState(() => this.time = time);
                        // },
                        description: description,
                          onChangedDescription: (title) {
                            setState(() => this.description = title);
                          },
                        // slot: slot,
                        // onChangedslot: (slot) {
                        //   setState(() => this.slot = slot);
                        // },
                          )
                  ),
                  FadeAnimation(
                      delay: 0.4,
                      child: widget.note?.description == null
                          ? _buildButtonCreate(context)
                          : _buildButtonSave(context)
                  ),
                  FadeAnimation(
                    delay: 0.2,
                    child: Container(
                      margin: EdgeInsets.only(top: he * 0.04,),
                      width: 55,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey[300], shape: BoxShape.circle),
                      child: Container(
                          width: 47,
                          height: 47,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffF4F6FD),
                          ),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                                size: 20,
                              )
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // TODO Update button ...
  Widget _buildButtonCreate(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Container(
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
    );
  }

  // TODO Save button ..
  Widget _buildButtonSave(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Container(
      width: we * 0.4,
      height: 50,
      margin: EdgeInsets.only(left: we * 0.45),
      child: ElevatedButton(
          onPressed: updateNote,
          style: ElevatedButton.styleFrom(
              primary: const Color(0xFF002FFF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Save",
                style: GoogleFonts.lato(color: Colors.white),
              ),
              SizedBox(
                width: we * 0.03,
              ),
              const Icon(
                Icons.edit,
                color: Colors.white,
              )
            ],
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
