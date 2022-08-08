import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Utils/modelClass.dart' as model;
import '../../Utils/Widgets.dart';
import '../../Utils/fire_auth.dart';
import '../../Utils/util.dart';
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                _isProcessing
                    ? CircularProgressIndicator()
                    : firebaseUIButton(
                        context,
                        "Sign Up",
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

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HidenDrawer(user: user,)));
                          }
                        },
                      ),
              ],
            ),
          ))),
    );
  }
}
