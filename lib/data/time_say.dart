import 'package:flutter/material.dart';
import 'package:flutter_todo/data/thems.dart';
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          boxShadow: [
            BoxShadow(
              color: Mytheme.prime_color2.withOpacity(0.12),
              offset: const Offset(-5,2),
              spreadRadius: 1,
              blurRadius: 20,
            ),
          ],
        ),
        child: Text(
      welcome(),
      style: GoogleFonts.poppins(
        color : Mytheme.welcome_clr,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ));
  }
}
