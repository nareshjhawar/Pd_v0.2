import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/global_myvar.dart';
import 'package:flutter_todo/pages/paints/CIrcle_paint.dart';

import '../data/thems.dart';
import 'button_change_them.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController nameController = TextEditingController();
  // SimpleGlobal.isdark_mode ;

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    final f2deco = BoxDecoration(
      gradient: LinearGradient(
        colors: [//0xFF5C5292
          Theme.of(context).focusColor.withOpacity(0.8),
          Theme.of(context).canvasColor.withOpacity(0.2),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
      ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(we*0.22),
            bottomRight: Radius.circular(we*0.22)
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.15),
            offset: const Offset(-8,8),
            spreadRadius: 0.5,
            blurRadius: 25,
          ),
        ]
    ) ;
    final f3deco = BoxDecoration(
        gradient: LinearGradient(
          colors: [//0xFF5C5292
            Theme.of(context).focusColor.withOpacity(0.4),
            Theme.of(context).canvasColor.withOpacity(0.1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(20)
    ) ;
    final f4deco = BoxDecoration(
        gradient: LinearGradient(
          colors: [//0xFF5C5292
            Theme.of(context).focusColor.withOpacity(0.6),
            Theme.of(context).canvasColor.withOpacity(0.3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
        ),
        // borderRadius: BorderRadius.circular(20)
      shape: BoxShape.circle,
    ) ;
    final f5deco = BoxDecoration(
      backgroundBlendMode: BlendMode.darken,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40)
    ) ;


    final tsytle1 = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    final tsytle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );


    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation:0,
        backgroundColor: Colors.transparent,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                 Icon(
                    Icons.bar_chart_rounded,
                    color: Theme.of(context).primaryColor ,
                    size: 32,
                  ),
              SizedBox(
                width: we * 0.42,
              ),

              SizedBox(
                width: we * 0.3,
              ),
              ChangeThembutton()
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Mytheme.darkapp,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: he*0.14),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: he*0.1,
                width: we*0.85,
                decoration: f5deco,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: f4deco,
                      child: IconButton(
                        onPressed: null,
                        icon: Icon(Icons.close_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: f4deco,
                      child: IconButton(
                        onPressed: null,
                        icon: Icon(Icons.check_rounded,
                            color: Theme.of(context).primaryColor,
                      ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: he*0.29,
                width: we*0.43,
                decoration: f2deco,
                child: Center(),
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.only(top: he*0.1),
            child: Column(
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CustomPaint(
                        painter: CirclePainter(),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: CircleAvatar(
                              radius: we*0.16,
                              backgroundImage: AssetImage("assets/Avatar.png")
                          ),

                        ),
                      ),
                    ),
                    SizedBox(height: he*0.01,),
                  ],
                ),
                SizedBox(
                  height: he*0.71,
                  child: Padding(
                    padding: const EdgeInsets.only(top:15,left: 30,right: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: he*0.01,
                          ),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              // border: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //       color: Colors.red,width: 2,style: BorderStyle.solid
                              //   ),
                              //   borderRadius: BorderRadius.circular(20),
                              // ),
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
                              labelText: 'Full Name',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor
                              ),
                            ),),
                          SizedBox(height: he*0.02,),
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
                              labelText: 'Phone',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor
                              ),
                            ),),
                          // SizedBox(height: he*0.02,),

                          SizedBox(height: he*0.02,),
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
                              labelText: 'E-mail',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor
                              ),
                            ),),
                          SizedBox(height: he*0.02,),

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
                              labelText: 'E-mail',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor
                              ),
                            ),),
                          SizedBox(height: he*0.02,),

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
                              labelText: 'Profession',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor
                              ),
                            ),),
                          SizedBox(height: he*0.02,),

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
                              labelText: 'Age',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor
                              ),
                            ),),
                          SizedBox(height: he*0.03,),

                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Current Productivity ",style: tsytle,),
                              Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).primaryColor,size: 20,)
                            ],
                          ),
                          SizedBox(height: he*0.025,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("80 %",style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                              ),),
                              SizedBox(width: we*0.05,),
                              Column(
                                  children: [
                                    Container(
                                      decoration: f3deco,
                                      child: TextButton(
                                        onPressed: null,
                                        child: Row(
                                          children: [
                                            Icon(Icons.keyboard_arrow_up_rounded,
                                              color: Theme.of(context).primaryColor,size: 22,),
                                            Text("\t\t Level Up \t\t\t",style: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontSize: 20,
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),]
                              ),
                            ],
                          ),
                          SizedBox(height: he*0.025,),

                          SizedBox(height: he*0.1,),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   // decoration: f2deco,
          //   padding: EdgeInsets.only(bottom: 40),
          //   alignment: Alignment.bottomCenter,
          //   child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Container(
          //           width: 70,
          //           height: 70,
          //           decoration: f4deco,
          //           child: IconButton(
          //             onPressed: null,
          //             icon: Icon(Icons.close_rounded),
          //           ),
          //         ),
          //         Container(
          //           width: 70,
          //           height: 70,
          //           decoration: f4deco,
          //           child: IconButton(
          //             onPressed: null,
          //             icon: Icon(Icons.check_rounded),
          //           ),
          //         ),
          //
          //       ],
          //     ),
          // ),
        ],
      ),
    );
  }

  // Widget _buildCircle(BuildContext context) {
  //   return CustomPaint(
  //     size: Size(50, 50),
  //     painter: CirclePainter(),
  //   );
  // }
}