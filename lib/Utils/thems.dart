import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'extra/darkRadialBackground.dart';


class ThemProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.light;
  setThemeMode(ThemeMode mode)async {
    themeMode =mode;
    notifyListeners();
  }

  void toggleThem(bool isOne) {
    themeMode = isOne ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Mytheme {
  static const main_bg =  Colors.transparent;

  static final darkapp = DarkRadialBackground(
    color:const Color(0xff181a1f),
    position: "topLeft",
  );


  // static late final metheme = darkapp;


  static const prime_color1 = Color(0xFF6A88E5);
  static const prime_color2 = Color(0xFF6C61AA);


  //nav bar
  static const nav_button_color = Color(0xFF7D96E7); //prime

  static const nav_shadow = Color(0xFF2E2E79);
  static const nav_shadow1 = Color(0xFF7576DC);

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

  static const date_color = Color(0xFFE0D5F8);

static final drawer_icons = Color(0xFFCDC2F6); //


  //timeline
  static final tl_color = Colors.deepPurple.shade200;
  static final bg_color = Color(0xFF6A88E5);

  // static final tl_color_inac = Colors.transparent;
  // static final bg_color_inac = Colors.black45;

  static final time_color = Color(0xFFC7B8FF);
  static final tl_card = Color(0xFFB9C6EE);
  static const tl_card_sh = Color(0xFF2E2949);
  static final tl_card_tx1 = Color(0xFFC3A8F3);
  static final tl_card_tx2 = Color(0xFFC4CCEF);
  // static final tl_card1 = Color(0xFFC3A8F3);
  // static final tl_card2 = Color(0xFFC3A8F3);

  static const welcome_clr = Color(0xFFA89EEE);

  static final text_1 = Colors.white70.withOpacity(0.85);
  // final Brightness.light = Colors.red;



  static final darkthem = ThemeData(
      scaffoldBackgroundColor:  const Color(0xff181a1f),
      splashColor: const Color(0xff434345),
      hoverColor: const Color(0xff242a3e),
      primaryColorLight: Color(0xff1f1a32),
      primaryColor: Color(0xFFBCB4F8), // text

      focusColor: Color(0xFFCDC2F6),

      cardColor:Color(0xFF5C5292).withOpacity(0.8), //color 1
      canvasColor:Color(0xFF6A88E5), //color2
      shadowColor: prime_color1.withOpacity(0.1), //shadow

    dividerColor: Color(0xFF665FB7).withOpacity(0.6),
    highlightColor: Color(0xFF8F9CE5),

    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
    ),

  );

  static final lightthem = ThemeData(
    scaffoldBackgroundColor: const Color(0xffd4cef0),
    primaryColorLight: Color(0xff868af7),
    primaryColor: Color(0xFF18133D).withOpacity(0.75),
    primaryColorDark: Colors.white70.withOpacity(0.85),

    focusColor: Color(0xFF695FA5),

    cardColor:Color(0xFFB3ABDE).withOpacity(0.5),
    canvasColor:Color(0xFF6A88E5),
    shadowColor: Color(0xFF8D9FED).withOpacity(0.6),

    dividerColor: Color(0xFF58568B).withOpacity(0.6),
    highlightColor: Color(0xFFAEA5EE),

      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light ,
        ),
      )
  );
}

// //light mode
// class Mytheme {
//   final lightcolor = Color(0xffd4cef0);
//   final darkcolor = Color(0xff181a1f);
//   static const main_bg = Colors.transparent;
//
//   static const welcome_clr = Color(0xFF1A1450);
//   static final lightapp = LightRadialBackground(
//     color1: HexColor.fromHex("#d4cef0"),
//     position1: "topLeft",
//   );
//
//
//   static final darkapp = LightRadialBackground(
//       color1: HexColor.fromHex("#d4cef0"),
//       position1: "topLeft",
//     );
//   static late final metheme = lightapp;
//
//   static const prime_color1 = Color(0xFF6A88E5);
//   static const prime_color2 = Color(0xFFA294F1);
//
//   static final drawer_icons = Color(0xFF796DB9);
//
//   //nav bar
//   static const nav_button_color = Color(0xFF6A88E5); //prime
//   static final nav_shadow = Color(0xFF9177EA).withOpacity(0.2);
//   static const nav_button_color1 = Color(0xFF8147EF);
//   static const nav_button_color2 = Color(0xFF6A88E5); //prime
// // nav_background
//   static const nav_bg1 = card_color1;
//   static const nav_bg2 = card_color2;
//
//   static const fbutton1 = Color(0xFF936BD9);
//   static const fbutton2 = Color(0xFF7E97E3); //pri
//   static const fbutton3 = Color(0xFF472087); //pri
//
//   // text
//   static const primary_color = Color(0xFF3E367B);
//   static final primary_color1 = Color(0xFF4135A0).withOpacity(0.8);
//
//   // card
//   static const card_color1 = Color(0xFF5C5292);
//   static const card_color2 = Color(0xFF6A88E5);// prime
//   static const date_color = Color(0xFFDAD1F3);
//
//
//   //timeline
//   static final tl_color = card_color1;
//   static final bg_color = card_color2;
//
//   static final time_color = Color(0xFF27234B);
//   static final tl_card = Color(0xFF0D45EE);
//   static final tl_card_sh = Color(0xFFB0B0B4);
//   static final tl_card_tx1 = Color(0xFF351471);
//   static final tl_card_tx2 = Color(0xFFCAC8E3);
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