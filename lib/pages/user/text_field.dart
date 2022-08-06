import 'package:flutter/material.dart';
const kBlack = Color(0xff1B232A);
const kDarkBlack = Color(0xff161C22);
const kGreen = Color(0xff5ed5a8);
const kRed = Color(0xffDD4B4B);
const kGrey = Color(0xff777777);
const kLightGrey = Color(0xffA7AFB7);
const kWhite = Color(0xffffffff);

Widget textField({
  required TextEditingController controller,
  required String hint,
  //required double height,
  bool obscureText = false,
 TextInputType? keybordType,
  Widget? suffixIcon,
}) {
  return SizedBox(
    //height: height,
    child: TextFormField(
      controller: controller,
      keyboardType: keybordType,
      style: const TextStyle(
        color: kWhite,
      ),
      obscureText: obscureText,
      cursorColor: kLightGrey,
      autofocus: false,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        hintStyle: const TextStyle(color: kGrey, fontSize: 14),
        filled: true,

        suffixIcon: suffixIcon,
        //focusColor: kGrey,
        fillColor: kDarkBlack,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14.0),
          ),
          borderSide: BorderSide(
            color: kDarkBlack,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: kLightGrey,
            // width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.all(15),
      ),
    ),
  );
}
