import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/data/thems.dart';
import 'package:flutter_todo/Widgets/button_change_them.dart';
import 'package:flutter_todo/Utils/global_myvar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Animation/fadeAnimation.dart';
import '../Widgets/paints/CIrcle_paint.dart';

class PageSettings extends StatefulWidget {
  const PageSettings({Key? key}) : super(key: key);

  @override
  State<PageSettings> createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  bool isclockcycle =false;
  bool isdarkmode = true;
  bool Ison = false;


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
    final f2deco = BoxDecoration(
      gradient: LinearGradient(
        colors: [//0xFF5C5292
          Theme.of(context).cardColor.withOpacity(0.8),
          Theme.of(context).canvasColor.withOpacity(0.0),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
      ),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ) ;
    final tsytle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    final tsytle1 = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 18,
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
    final ic_cl = Theme.of(context).primaryColor;
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

    final themprovider = Provider.of<ThemProvider>(context);

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
        Mytheme.darkapp,
        FadeAnimation(
          delay: 0.5,
          child: Padding(
            padding: EdgeInsets.only(
                top:he* 0.05 ,left: we *0.05, right:  we *0.05),
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    //Settings
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text("Settings",
                              style: GoogleFonts.poppins(
                                color: Color(0xff9370b1).withAlpha(30),
                                fontSize: 50,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                      ],
                    ),
                    Container(
                      child: Container(
                        decoration: f2deco,
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Center(
                                        heightFactor: 0.3,
                                        child: CustomPaint(
                                          painter: CirclePainter(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                                radius: 50.0,
                                                backgroundImage: AssetImage("assets/Avatar.png")),
                                          ),
                                        )
                                    ),]
                              ),
                            ),
                            Container(
                              margin:EdgeInsets.only(top: 20,left: 30,bottom: 40),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text( "Hi, Naresh!",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor.withOpacity(0.6),
                                        fontWeight:FontWeight.w700,
                                        fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 50,left: 10),
                                      decoration: f2deco,
                                      child: TextButton(
                                        onPressed: null,
                                        child: Text("\t\t\tEdit\t\t\t",style: tsytle1),
                                      ),
                                    ),]
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: he*0.02,),
                    //timeline
                    SizedBox(height: he*0.02,),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff9370b1).withAlpha(30),
                            ),
                            child: Icon(Icons.timelapse_rounded,color: ic_cl,size: 20,)),
                        SizedBox(width: we*0.02,),
                        Text("Timeline",style: tsytle,)],),
                    SizedBox(height: he*0.01,),
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                      decoration: f2deco,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Event Interval",style: tsytle1,),
                              SizedBox(width: we*0.3),
                              Icon(Icons.arrow_forward_ios_rounded ,color: ic_cl,),
                            ],
                          ),
                          SizedBox(height: he*0.02,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Routines",style: tsytle1,),
                              SizedBox(width: we*0.4),
                              Icon(Icons.arrow_forward_ios_rounded,color: ic_cl,),
                            ],
                          ),
                          SizedBox(height: he*0.02,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tags ",style: tsytle1,),
                              SizedBox(width: we*0.4),
                              Icon(Icons.arrow_forward_ios_rounded,color: ic_cl,),
                            ],
                          ),
                          SizedBox(height: he*0.02,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sleep Cycle ",style: tsytle1,),
                              SizedBox(width: we*0.3),
                              Icon(Icons.arrow_forward_ios_rounded,color: ic_cl,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: he*0.04,),
                    //view
                    Row(children: [
                      Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff9370b1).withAlpha(30),
                          ),
                          child: Icon(Icons.view_agenda_outlined, color: ic_cl,size: 20,)),
                      SizedBox(width: 0.02*we,),
                      Text("View",style: tsytle,)],),
                    SizedBox(height: he*0.01,),
                    Container(
                      decoration: f2deco,
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("24 Hour Time ",style: tsytle1,),
                              CupertinoSwitch(
                                value: isclockcycle,
                                activeColor: Theme.of(context).primaryColor,
                                onChanged: ( value) {
                                  setState((){
                                    isclockcycle =value;
                                  });
                                },),
                            ],
                          ),
                          SizedBox(height: he*0.02,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Dark Mode ",style: tsytle1),
                              CupertinoSwitch(
                                value: isdarkmode,
                                activeColor: Theme.of(context).primaryColor,
                                onChanged: ( value) {
                                  setState((){
                                    isdarkmode =value;
                                    SimpleGlobal.isdark_mode = value;
                                    final provider = Provider.of<ThemProvider>(context, listen: false);
                                    Ison = themprovider.isDarkMode ;
                                    provider.toggleThem(Ison);
                                  });
                                },),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: he*0.04,),
                    //notify
                    Row(children: [
                      Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff9370b1).withAlpha(30),
                          ),
                          child: Icon(Icons.notification_add_outlined, color: ic_cl,size: 20,)),
                      SizedBox(width: 0.02*we,),
                      Text("Notify",style: tsytle,)],),
                    SizedBox(height: he*0.01,),
                    Container(
                      decoration: f2deco,
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Daily Reminder  ",style: tsytle1,),
                              Icon(Icons.arrow_forward_ios_rounded,color: ic_cl,),
                            ],
                          ),
                          SizedBox(height: he*0.02,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Event Reminder  ",style: tsytle1,),
                              Icon(Icons.arrow_forward_ios_rounded,color: ic_cl,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: he*0.04,),
                    //features
                    Row(children: [
                      Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff9370b1).withAlpha(30),
                          ),
                          child: Icon(Icons.change_circle_outlined, color: ic_cl,size: 20,)),
                      SizedBox(width: 0.02*we,),

                      Text("Features",style: tsytle,)],),
                    SizedBox(height: he*0.01,),
                    Container(
                      decoration: f2deco,
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Siri Play ",style: tsytle1,),
                              Icon(Icons.arrow_forward_ios_rounded,color: ic_cl),
                            ],
                          ),
                          SizedBox(height: he*0.02,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Task Tones  ",style: tsytle1),
                              Icon(Icons.arrow_forward_ios_rounded,color: ic_cl,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: he*0.04,),
                    //miscellaneous
                    Row(children: [
                      Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff9370b1).withAlpha(30),
                          ),
                          child: Icon(Icons.file_copy_rounded, color: ic_cl,size: 20,)),
                      SizedBox(width: 0.02*we,),

                      Text("Miscellaneous",style: tsytle,)],),
                    SizedBox(height: he*0.01,),
                    Container(
                      decoration: f2deco,
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Rate Prodo  ",style: tsytle1,),
                              Icon(Icons.arrow_forward_ios_rounded,color: ic_cl,),
                            ],
                          ),
                          SizedBox(height: he*0.02,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Terms of Service   ",style: tsytle1,),
                              Icon(Icons.arrow_forward_ios_rounded,color: ic_cl,),
                            ],
                          ),
                          SizedBox(height: he*0.02,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Privacy Policy  ",style: tsytle1,),
                              Icon(Icons.arrow_forward_ios_rounded,color: ic_cl,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: he*0.14,)
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