import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/global_myvar.dart';
import 'package:flutter_todo/pages/paints/CIrcle_paint.dart';

import '../../data/thems.dart';
import '../Drawerhiden/hidendrawer.dart';
import '../homepage.dart';

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
          top: Radius.circular(30),
            bottom: Radius.circular(30)

    ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.05),
            offset: const Offset(-2,8),
            spreadRadius: 1,
            blurRadius: 20,
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
    final b_deco =ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.all(15)
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      backgroundColor:
      MaterialStateProperty.all(Colors.transparent),
      shadowColor:
      MaterialStateProperty.all(Colors.transparent),
    );


    final tsytle1 = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    final tsytle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
    final tsytle2 = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 25,
      fontWeight: FontWeight.w600,
    );



    return Scaffold(
      body: Stack(
        children:[
          Mytheme.darkapp,
          Container(
            margin: EdgeInsets.only(top: he*0.07),
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: he*0.3,
                child: Image.asset('assets/Mask_Group.png')),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(left: 19, right: 18, top: 10, bottom: 33, ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Column(
                  children:[
                    Text(
                      "Welcome Back!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xbfffffff),
                        fontSize: 20,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: he*0.01),
                    Text(
                      "Please, Log In.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: he*0.04),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(37),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children:[
                      Icon(Icons.alternate_email_rounded),
                      SizedBox(width: we*0.05),
                      Text(
                        "johnsondoe@nomail.com",
                        style: tsytle,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: he*0.02),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(37),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children:[
                      Icon(Icons.lock_outline_rounded),
                      SizedBox(width: we*0.05),
                      Text(
                        "*****************",
                        style: tsytle,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: he*0.02),
                Container(
                  decoration: f2deco,
                  child: ElevatedButton(
                    style: b_deco,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> HidenDrawer(),
                        fullscreenDialog: true,

                      ));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Continue",
                          textAlign: TextAlign.center,
                          style: tsytle1,
                        ),
                        Icon(Icons.arrow_forward_ios_rounded,size: 20,
                          color: Colors.white,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: he*0.04),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Container(
                      width: 64,
                      height: 64,
                      child: Stack(
                        children:[
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x14000000),
                                  blurRadius: 45,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              color: Colors.white,
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset('assets/google.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 24),
                    Container(
                      width: 64,
                      height: 64,
                      child: Stack(
                        children:[
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x14000000),
                                  blurRadius: 45,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              color: Colors.white,
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:Image.asset('assets/facebook.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 24),
                    Container(
                      width: 64,
                      height: 64,
                      child: Stack(
                        children:[
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x14000000),
                                  blurRadius: 45,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              color: Colors.white,
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset('assets/apple.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: he*0.02),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Text('.'*30,style: TextStyle(color:Colors.white ),),
                      SizedBox(width: 9.50),
                      Text(
                        "Or",
                        style: tsytle1,
                      ),
                      SizedBox(width: 9.50),
                      Text('.'*30,style: TextStyle(color:Colors.white ),),
                    ],
                  ),
                ),
                SizedBox(height: he*0.02),
                Container(
          decoration: f2deco,
          child: ElevatedButton(
            style: b_deco,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> HidenDrawer(),
                fullscreenDialog: true,

              ));
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Create an Account",
                  textAlign: TextAlign.center,
                  style: tsytle1,
                ),
                Icon(Icons.arrow_forward_ios_rounded,size: 20,
                  color: Colors.white,),
              ],
            ),
          ),
        ),
              ],
            ),
          ),
        ],
      ),
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

}