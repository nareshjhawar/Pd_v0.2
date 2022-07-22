import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_todo/data/thems.dart';
import 'package:google_fonts/google_fonts.dart';

class PageSettings extends StatefulWidget {
  const PageSettings({Key? key}) : super(key: key);

  @override
  State<PageSettings> createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  bool isSwitched =false;

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    final cdeco = BoxDecoration(
      // color: Mytheme.main_bg,
      gradient: LinearGradient(
        colors: [//0xFF5C5292
          Mytheme.darkthem.cardColor.withOpacity(0.05),
          Mytheme.darkthem.canvasColor.withOpacity(0.05),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Mytheme.darkthem.shadowColor.withOpacity(0.2),
          offset: const Offset(-10,10),
          spreadRadius: 15.5,
          blurRadius: 40,
        ),
      ],

    );
    final f1deco = BoxDecoration(
      gradient: LinearGradient(
        colors: [//0xFF5C5292
          Theme.of(context).cardColor.withOpacity(0.7),
          Theme.of(context).canvasColor.withOpacity(0.7),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
      ),
      borderRadius: BorderRadius.all(Radius.circular(30)),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
          offset: const Offset(-8,8),
          spreadRadius: 0.5,
          blurRadius: 20,
        ),
      ],

    ) ;
    final tsytle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
    final bdeco = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).cardColor,
          offset: Offset(4,4),
          blurRadius: 15,
          spreadRadius: 1.0
        ),
        BoxShadow(
            color: Theme.of(context).canvasColor,
            offset: Offset(4,4),
            blurRadius: 15,
            spreadRadius: 1.0
        )
      ],
    );

    final buttondec = BoxDecoration(
      gradient: LinearGradient(
        colors: [//0xFF5C5292
          Mytheme.darkthem.cardColor.withOpacity(0.1),
          Mytheme.darkthem.canvasColor.withOpacity(0.1),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
      ),

      borderRadius: BorderRadius.all(Radius.circular(50)),
      boxShadow: [
        BoxShadow(
          color: Mytheme.darkthem.primaryColor.withOpacity(0.3),
          offset: const Offset(-10,10),
          spreadRadius: 1.0,
          blurRadius: 10,
        ),
      ],

    );
    return Scaffold(
      extendBody: true,
      // backgroundColor: Colors.white70,
      body: Stack(
        children: [
          Mytheme.darkapp,
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                        margin: EdgeInsets.only(left: 5),
                          child: Text("Settings",
                          style: GoogleFonts.poppins(
                              color: Color(0xff3c3c52).withAlpha(40),
                          fontSize: 50,
                          fontWeight: FontWeight.w700
                          ),
                          )),
                      ],
                    ),
                    Container(
                      // color: Theme.of(context).cardColor,
                      child: Container(
                        clipBehavior: Clip.none,
                        decoration: f1deco,
                        margin: EdgeInsets.only(top: 0, left: 30,right: 30,bottom: 30),
                        child: Stack(
                          children: [
                            Container(
                              clipBehavior: Clip.none,
                              margin: EdgeInsets.only(right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [const Center(
                                  heightFactor: 0.3,
                                    child: CircleAvatar(
                                        radius: 50.0,
                                        backgroundImage: AssetImage("assets/Avatar.png"))
                                ),]
                              ),
                            ),
                            Container(
                              margin:EdgeInsets.only(top: 10,left: 15,bottom: 40),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text( "Hi, Naresh",
                                    style: TextStyle(
                                    color: Theme.of(context).focusColor.withOpacity(0.6),
                                      fontWeight:FontWeight.w700,
                                      fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                  // color: Colors.black.withOpacity(0.1) ,
                                  margin: EdgeInsets.only(top: 60,left: 10),
                                  decoration: f1deco,
                                  child: TextButton(
                                    onPressed: null,
                                    child: Text("Edit Profile",style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white70.withOpacity(0.6),
                                    ),),
                                  ),
                                ),]
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: he*0.02,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Icon(Icons.timeline),
                        ),
                        SizedBox(width: we*0.05,),
                        Text("Timeline",style: tsytle,)],),
                    SizedBox(height: he*0.01,),
                    ClipRRect(
                      // borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 40,sigmaY: 40),
                        child: Container(
                          decoration: f1deco,
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Event Interval",style: tsytle,),
                                    SizedBox(width: we*0.3),
                                    Icon(Icons.arrow_right),
                                  ],
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Routines",style: tsytle,),
                                    SizedBox(width: we*0.4),
                                    Icon(Icons.arrow_right),
                                  ],
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Tags ",style: tsytle,),
                                    SizedBox(width: we*0.4),
                                    Icon(Icons.arrow_right),
                                  ],
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Sleep Cycle ",style: tsytle,),
                                    SizedBox(width: we*0.3),
                                    Icon(Icons.arrow_right),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: he*0.04,),
                    Row(children: [Icon(Icons.view_week_rounded),Text("View")],),
                    Container(
                      decoration: cdeco,
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                Text("24 Hour Time "),
                                SizedBox(width: 40),
                                Switch(value: isSwitched,
                                  onChanged: ( value) {
                                    setState((){
                                      isSwitched =value;
                                    });
                                  },),
                          ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Dark Mode "),
                              SizedBox(width: 40),
                              Switch(value: isSwitched,
                                onChanged: ( value) {
                                  setState((){
                                    isSwitched =value;
                                  });
                                },),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: he*0.04,),
                    Row(children: [Icon(Icons.notification_important),Text("Notify")],),
                    Container(
                      decoration: cdeco,
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Daily Reminder  "),
                              SizedBox(width: 40),
                              Icon(Icons.arrow_right),
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Event Reminder  "),
                              SizedBox(width: 40),
                              Icon(Icons.arrow_right),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: he*0.04,),
                    Row(children: [Icon(Icons.featured_play_list_rounded),Text("Features")],),
                    Container(
                      decoration: cdeco,
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Siri Play "),
                              SizedBox(width: 40),
                              Icon(Icons.arrow_right),
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Task Tones  "),
                              SizedBox(width: 40),
                              Icon(Icons.arrow_right),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: he*0.04,),
                    Row(children: [Icon(Icons.file_copy_rounded),Text("Miscellaneous")],),
                    Container(
                      decoration: cdeco,
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Rate Prodo  "),
                              SizedBox(width: 40),
                              Icon(Icons.arrow_right),
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Terms of Service   "),
                              SizedBox(width: 40),
                              Icon(Icons.arrow_right),
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Privacy Policy  "),
                              SizedBox(width: 40),
                              Icon(Icons.arrow_right),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ]
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}