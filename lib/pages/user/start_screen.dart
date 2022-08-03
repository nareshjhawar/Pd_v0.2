import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/user/signin_screen.dart';
import 'package:flutter_todo/pages/user/signup_screen.dart';
import 'package:flutter_todo/pages/user/mylogin.dart';

import '../../Animation/fadeAnimation.dart';
import '../../data/thems.dart';
import '../Drawerhiden/hidendrawer.dart';

class Start_screenWidget extends StatefulWidget {
  @override
  _Start_screenWidgetState createState() => _Start_screenWidgetState();
}

class _Start_screenWidgetState extends State<Start_screenWidget> {
  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HidenDrawer()),
      );
    }

    return firebaseApp;
  }
  double delay_time=0.5;


  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    final f2deco = BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [//0xFF5C5292
        //     // Theme.of(context).focusColor.withOpacity(0.5),
        //     // Theme.of(context).canvasColor.withOpacity(0.2),
        //     Color(0xff1a1c21).withOpacity(0.6),
        //     Color(0xff1e1b2a).withOpacity(0.6)
        //   ],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomLeft,
        // ),
        color: Colors.white60,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white54,
        borderRadius: BorderRadius.circular(30
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(-2, 8),
            spreadRadius: 0.5,
            blurRadius: 25,
          ),
        ]);
    final f3deco = BoxDecoration(
        gradient: LinearGradient(
          colors: [
            //0xFF5C5292
            Theme.of(context).focusColor.withOpacity(0.6),
            Theme.of(context).canvasColor.withOpacity(0.2),
          colors: [//0xFF5C5292
            Theme.of(context).focusColor.withOpacity(0.8),
            Theme.of(context).canvasColor.withOpacity(0.3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)));
    final f5deco = BoxDecoration(
        backgroundBlendMode: BlendMode.darken,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40));

    final b_deco = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );

    final tsytle1 = TextStyle(
      color: Color(0xff211d2a),
      fontSize: 22,
      fontWeight: FontWeight.w500,
    );
    final tsytle = TextStyle(
      color: Colors.white70,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
    final tsytle2 = TextStyle(
      color: Colors.white70,
      fontSize: 36,
      fontWeight: FontWeight.w700,
    );

    return Scaffold(
      body: Stack(
        children: [
          Mytheme.darkapp,
          SizedBox(
            height: he * 0.6,
            child: Center(
              child: Container(
                width: 190,
                height: 220,
                child: Image.asset('assets/logo/head.png'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: he * 0.4,
              decoration: f3deco,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: tsytle2,
                  ),
                  SizedBox(height: he * 0.03),
                  Text(
                    "Let’s increase the productivity of yours "
                    "by making a good routine throughout your day.",
                    style: tsytle,
                  ),
                  SizedBox(height: he * 0.08),
                  FutureBuilder(
                      future: _initializeFirebase(),
                      builder: (ctx, snp) {
                        if (snp.connectionState == ConnectionState.done) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: f2deco,
                                child: ElevatedButton(
                                  style: b_deco,
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: GestureDetector(
                                        onTap: () {

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignInScreen()));
                                        },
                                        child: Text("Sign in", style: tsytle1)),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: f2deco,
                                child: ElevatedButton(
                                  style: b_deco,
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUpScreen()));
                                        },
                                        child: Text("Sign up", style: tsytle1)),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return CircularProgressIndicator();
                      }),
                ],
          FadeAnimation(
            delay: delay_time,
            child: SizedBox(
              height: he*0.6,
              child: Center(
                child: Container(
                  width: 150,
                  height: 180,
                  child: Image.asset('assets/logo/head.png'),
                ),
              ),
            ),
          ),
          FadeAnimation(
            delay: delay_time+2.0,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: he*0.48,
                decoration: f3deco,
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text("Welcome",style: tsytle2,),
                    SizedBox(height: he*0.03),
                    Text(
                      "Let’s increase the productivity of yours "
                          "by making a good routine throughout your day.",
                      style: tsytle,
                    ),
                    SizedBox(height: he*0.14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Container(
                          decoration: f2deco,
                          child: ElevatedButton(
                            style: b_deco,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=> MyLogin()));
                            },
                            child:  Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("Get Started",style: tsytle1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
