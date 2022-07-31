import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/global_myvar.dart';
import 'package:flutter_todo/pages/paints/CIrcle_paint.dart';

import '../../data/thems.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController nameController = TextEditingController();

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
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30)
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.15),
            offset: const Offset(-2,-8),
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
    final tsytle2 = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 25,
      fontWeight: FontWeight.w600,
    );



    return Scaffold(
      // extendBodyBehindAppBar: true,
      // extendBody: true,
      body: Stack(
        children: [
          Mytheme.darkapp,
          Positioned(
            bottom: 0,
            child: Container(
              decoration: f2deco,
              // alignment: Alignment.bottomCenter,
              // margin: EdgeInsets.only(top: he*0.1),
              child: Column(
                children: [
                  Container(
                    height: he*0.4,
                    child: Column(
                      children: [
                        Text("Welcome",style: tsytle2,),
                        Text("welcome to prodo, welcome to prodo,"
                            " welcome to prodo, welcome to prodo, "
                            "welcome to prodo, ",style: tsytle1,),
                        Row(children: [
                          TextButton(onPressed: null, child: Text("Sign in",style: tsytle,)),
                          TextButton(onPressed: null, child: Text("Sign Up",style: tsytle,)),

                        ],)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}