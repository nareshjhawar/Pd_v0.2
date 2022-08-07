import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Utils/thems.dart';

import '../../Utils/Widgets.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
    final tsytle = TextStyle(
      color: Theme.of(context).focusColor,
      fontSize: 32,
      fontFamily: "SF Pro Display",
      fontWeight: FontWeight.w800,
    );



    return Stack(
        children: [
          Mytheme.darkapp,
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(child: Text("Password",style: tsytle,)),
              Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.transparent
                  ),
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)
                          ),

                          child: reusableTextField("Enter an email Id", Icons.person_outline, false,
                              _emailTextController),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: f2deco,
                          child: firebaseUIButton(context, "Reset Password", () {
                            FirebaseAuth.instance
                                .sendPasswordResetEmail(email: _emailTextController.text)
                                .then((value) => Navigator.of(context).pop());

                          }),
                        )
                      ],
                    ),
                  ))),
            ],
          ),
        ],
      );
  }
}
