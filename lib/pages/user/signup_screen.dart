import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../data/data_model.dart' as model ;
import '../../Utils/Widgets.dart';
import '../../Utils/fire_auth.dart';
import '../../Utils/thems.dart';
import '../Drawerhiden/hidendrawer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;

    final _snackBar2 = SnackBar(
      content: Text('Try Again'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label:'Click',
        onPressed: () {
          print('Action is clicked');
        },
        textColor: Colors.white,
        disabledTextColor: Colors.grey,
      ),
      onVisible: () {
        print('Snackbar is visible');
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(30.0),
      padding: EdgeInsets.all(15.0),
    );

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
    final tsytle = TextStyle(
      color: Theme.of(context).focusColor,
      fontSize: 32,
      fontFamily: "SF Pro Display",
      fontWeight: FontWeight.w800,
    );

    return Scaffold(
      body: Stack(
          children: [
            Mytheme.darkapp,
            Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(child: Text("Sign Up",style: tsytle,)),
                    SizedBox(
                      height: he*0.55,
                      child: SingleChildScrollView(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(30, 30, 30, 40),
                        child: Column(
                          children: <Widget>[
                            //Fields
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)
                                  ),

                                  child: reusableTextField("Enter Username", Icons.alternate_email, false,
                                      _userNameTextController),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)
                                  ),

                                  child: reusableTextField("Enter an email Id", Icons.email_outlined, false,
                                      _emailTextController),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)
                                  ),

                                  child: reusableTextField("Enter Password", Icons.lock_outlined, true,
                                      _passwordTextController),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            _isProcessing
                                ? CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,)
                                : Container(
                                  decoration: f2deco,
                                  child: firebaseUIButton(
                                      context,
                                      "Sign up",
                                      () async {
                                        setState(() {
                                          _isProcessing = true;
                                        });
                                        User? user =
                                            await FireAuth.registerUsingEmailPassword(
                                          name: _userNameTextController.text,
                                          email: _emailTextController.text,
                                          password: _passwordTextController.text,
                                        );

                                        setState(() {
                                          _isProcessing = false;
                                        });

                                        if (user != null) {
                                          model.UserCustom _user = model.UserCustom(
                                            name: _userNameTextController.text,
                                            uid: user.uid,
                                            routine: [],
                                            records: [],
                                          );

                                          // adding user in our database
                                          await FirebaseFirestore.instance
                                              .collection("users")
                                              .doc(user.uid)
                                              .set(_user.toJson());

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => HidenDrawer(user: user,),
                                                fullscreenDialog: true,
                                              ));
                                        }
                                        else{
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar_error('Requirements are met'));
                                        }
                                      },
                                    ),
                                ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(child:Text('Create an account with',
                              style: TextStyle(color: Colors.white70,fontSize: 18),
                            )),
                            const SizedBox(
                              height: 20,
                            ),
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

                          ],
                        ),
                      )),
                    ),
                  ],
                )),
          ],
        ),
    );
  }
}
