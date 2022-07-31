import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/user/text_field.dart';

import 'constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController signUpMobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: CustomAppBar("Sign Up"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Register with mobile",
              style: TextStyle(
                  fontSize: 30, color: kWhite, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Text(
              "Please type your number, then we’ll send a verification code for authentication.",
              style: TextStyle(
                  fontSize: 15, color: kLightGrey, fontFamily: "MYRIADPRO"),
            ),
            const Spacer(
              flex: 3,
            ),
            const Text(
              "Mobile number",
              style: TextStyle(color: kLightGrey, fontFamily: "MYRIADPRO"),
            ),
            const Spacer(),
            textField(
                controller: signUpMobileController,
                hint: "Enter your mobile number",
                keybordType: TextInputType.number),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
