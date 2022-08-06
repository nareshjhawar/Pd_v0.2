import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/user/reset_password.dart';
import '../../Utils/fire_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_todo/pages/user/signup_screen.dart';

import '../../Utils/Widgets.dart';
import '../../data/thems.dart';
import '../Drawerhiden/hidendrawer.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  bool _isProcessing = false;


  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;

    final f2deco = BoxDecoration(
      gradient: LinearGradient(
        colors: [//0xFF5C5292
          Theme.of(context).focusColor.withOpacity(0.7),
          Theme.of(context).canvasColor.withOpacity(0.1),
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
    final b_deco =ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.all(10)
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

    // final _snackBar2 = SnackBar(
    //   content: Text('Try Again'),
    //   duration: const Duration(seconds: 3),
    //   action: SnackBarAction(
    //     label:'Click',
    //     onPressed: () {
    //       print('Action is clicked');
    //     },
    //     textColor: Colors.white,
    //     disabledTextColor: Colors.grey,
    //   ),
    //   onVisible: () {
    //     print('Snackbar is visible');
    //   },
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    //   behavior: SnackBarBehavior.floating,
    //   margin: EdgeInsets.all(30.0),
    //   padding: EdgeInsets.all(15.0),
    // );

    final tsytle1 = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );

    return Scaffold(
      body: Stack(
        children:[
          Mytheme.darkapp,
          Container(
            margin: EdgeInsets.only(top: he*0.05),
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: he*0.3,
                child: Image.asset('assets/sign_in.png')),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                //welcome text
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
                // fields
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: reusableTextField(
                          "Username",
                          Icons.alternate_email,
                          false,
                          _emailTextController),
                    ),
                    SizedBox(height: he*0.02),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: reusableTextField("Password", Icons.lock_outline, true,
                          _passwordTextController),
                    ),
                  ],
                ),
                forgetPassword(context),
                _isProcessing
                    ? CircularProgressIndicator(
                    color: Theme.of(context).primaryColor)
                    : Container(
                      decoration: f2deco,
                      child: firebaseUIButton(context, "Sign In", () async {
                  setState(() {
                      _isProcessing = true;
                  });
                  User? user = await FireAuth.signInUsingEmailPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                  );

                  setState(() {
                      _isProcessing = false;
                  });

                  if (user != null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HidenDrawer(),
                            fullscreenDialog: true,
                          ));
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        snackBar_error('Incorrect user details'));
                  }
                }),
                    ),

                SizedBox(height: he*0.03),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Container(
                      width: 50,
                      height: 50,
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
                      width: 50,
                      height: 50,
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
                      width: 50,
                      height: 50,
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
                      Center(child:
                      Text('Create an account',
                        style: TextStyle(color: Colors.white70,fontSize: 18),
                      )),

                    ],
                  ),
                ),
                SizedBox(height: he*0.02),
                Container(
                  decoration: f2deco,
                  child: ElevatedButton(
                    style: b_deco,
                    onPressed: () {
                      showModalBottomSheet(
                          constraints: BoxConstraints(maxHeight: he*0.65),
                          isScrollControlled: true,
                          enableDrag: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          backgroundColor: Colors.transparent,
                          context: context,

                          builder: (context) =>  ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                              child: const SignUpScreen()));
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign up",
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

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push((context),
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    var he = MediaQuery.of(context).size.height;

    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => showModalBottomSheet(
            constraints: BoxConstraints(maxHeight: he*0.4),
            isScrollControlled: true,
            enableDrag: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            backgroundColor: Colors.transparent,
            context: context,

            builder: (context) =>  ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                child: const ResetPassword())),
      ),
    );
  }

}
