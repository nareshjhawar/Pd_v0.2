import 'package:flutter/material.dart';

import '../extra/Values/values.dart';
import '../extra/darkRadialBackground.dart';

class ThemProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.light;

  void toggleThem(bool isOne) {
    themeMode = isOne ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
// for dark mode
class Mytheme {
  final lightcolor = Color(0xffd4cef0);
  final darkcolor = Color(0xff181a1f);
  static const main_bg = Colors.transparent;

  static final darkapp = DarkRadialBackground(
    color: HexColor.fromHex("#181a1f"),
    position: "topLeft",
  );
  static final lightapp = LightRadialBackground(
    color1: HexColor.fromHex("#d4cef0"),
    position1: "topLeft",
  );
  static late final metheme = darkapp;


  static const prime_color1 = Color(0xFF6A88E5);
  static const prime_color2 = Color(0xFF6C61AA);


  //nav bar
  static const nav_button_color = Color(0xFF7D96E7); //prime
  static const nav_shadow = Color(0xFF494A87);
  static const nav_button_color1 = Color(0xFF8F5DEE);
  static const nav_button_color2 = Color(0xFF6A88E5); //prime

  static const fbutton1 = Color(0xFF9574CE);
  static const fbutton2 = Color(0xFF5569A8); //pri
  static const fbutton3 = Color(0xFF232C4B); //pri

// nav_background
  static const nav_bg1 = Color(0xFF7D8EDB);
  static const nav_bg2 = Color(0xFF5A5694);
  // text
  static const primary_color = Colors.white70;
  static final primary_color1 = Colors.white70.withOpacity(0.7);

  // card
  static final card_color1 = Color(0xFF5C5292).withOpacity(0.5);
  static const card_color2 = Color(0xFF6A88E5);// prime

  static const date_color = Color(0xFFCDC2F6);


  //timeline
  static final tl_color = Colors.deepPurple.shade200;
  static final bg_color = Color(0xFF6A88E5);

  // static final tl_color_inac = Colors.transparent;
  // static final bg_color_inac = Colors.black45;

  static final time_color = Color(0xFFC7B8FF);
  static final tl_card = Color(0xFFB9C6EE);
  static final tl_card_sh = Color(0xFF2E2949);
  static final tl_card_tx1 = Color(0xFFC3A8F3);
  static final tl_card_tx2 = Color(0xFFC3CCEF);
  // static final tl_card1 = Color(0xFFC3A8F3);
  // static final tl_card2 = Color(0xFFC3A8F3);

  static const welcome_clr = Color(0xFFA89EEE);


  static final darkthem = ThemeData(
      scaffoldBackgroundColor: const Color(0xff212121),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff212121)),
      primaryColor: Colors.white70,
      cardColor: const Color(0xff404040),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF9363f2)));

  static final lightthem = ThemeData(
    primaryColor: Colors.black,
    // cardColor: const Color(0xffcab1fa),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff2b2040)),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xffF4F6FD)),
  );
} // dark mode
//
// //light mode
// class Mytheme {
//   final lightcolor = Color(0xffd4cef0);
//   final darkcolor = Color(0xff181a1f);
//   static const main_bg = Colors.transparent;
//
//   static const welcome_clr = Color(0xFF1A1450);
//
//   static final darkapp = LightRadialBackground(
//       color1: HexColor.fromHex("#d4cef0"),
//       position1: "topLeft",
//     );
//
//   static const prime_color1 = Color(0xFF6A88E5);
//   static const prime_color2 = Color(0xFF5C5292);
//
//   //nav bar
//   static const nav_button_color = Color(0xFF6A88E5); //prime
//   static const nav_shadow = Color(0xFF9182EC);
//   static const nav_button_color1 = Color(0xFF8147EF);
//   static const nav_button_color2 = Color(0xFF6A88E5); //prime
// // nav_background
//   static const nav_bg1 = Color(0xFF7D8EDB);
//   static const nav_bg2 = Color(0xFF5A5694);
//   // text
//   static const primary_color = Color(0xFF100A40);
//   // card
//   static const card_color1 = Color(0xFF5C5292);
//   static const card_color2 = Color(0xFF6A88E5);// prime
//   static const date_color = Color(0xFFA481F5);
//
//
//   //timeline
//   static final tl_color = Colors.deepPurple.shade200;
//   static final bg_color = Colors.deepPurple.shade400;
//   static final time_color = Color(0xFF1A1450);
//   static final tl_card = Color(0xFF0D45EE);
//   static final tl_card_sh = Color(0xFFB0B0B4);
//   static final tl_card_tx1 = Color(0xFF351471);
//   static final tl_card_tx2 = Color(0xFF6460A0);
//
//
//   static final darkthem = ThemeData(
//       scaffoldBackgroundColor: const Color(0xff212121),
//       appBarTheme: const AppBarTheme(backgroundColor: Color(0xff212121)),
//       primaryColor: Colors.white70,
//       cardColor: const Color(0xff404040),
//       floatingActionButtonTheme: const FloatingActionButtonThemeData(
//           backgroundColor: Color(0xFF9363f2)));
//
//   static final lightthem = ThemeData(
//     primaryColor: Colors.black,
//     // cardColor: const Color(0xffcab1fa),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//         backgroundColor: Color(0xff2b2040)),
//     appBarTheme: const AppBarTheme(backgroundColor: Color(0xffF4F6FD)),
//   );
// }