import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
  String text = "";
  int nowtime = DateTime.now().hour;
  String welcome() {
    text = "Welcome Back !️";
    // if (nowtime <= 11) {
    //   text = "Welcome Back !️";
    // }
    // if (nowtime > 11) {
    //   text = "Welcome Back !️";
    // } if (nowtime >= 16){
    //   text = "Welcome Back !️";
    // } if (nowtime >= 18) {
    //   text = "Welcome Back !️";
    // }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      welcome(),
      style: GoogleFonts.poppins(
        color : Color(0xFFB3AFEE),
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ));
  }
}
