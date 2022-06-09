import 'package:flutter/material.dart';

class ThemProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.light;

  void toggleThem(bool isOne) {
    themeMode = isOne ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Mytheme {
  final lightcolor = Color(0xffd4cef0);
  final darkcolor = Color(0xff181a1f);
  static final darkthem = ThemeData(
      scaffoldBackgroundColor: const Color(0xff212121),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff212121)),
      primaryColor: Colors.white,
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
}
