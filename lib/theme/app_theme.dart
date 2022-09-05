import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFb282e5);
  static const Color accentColor = Color(0xFF67d9b0);
  static const Color ligthGray = Color(0xFFECEDF2);
  static const Color white = Color(0xFFfefefe);
  static const Color yellow = Color(0xFFffde94);
  static const Color red = Color(0xFFf26d65);
  static const Color text = Color(0xFF373042);
  static const Color background = Color(0Xfff3eef4);

  //inputs colors
  static const Color inputErrorBorder = Color.fromARGB(255, 213, 51, 51);
  static const Color inputFocusBorder = Color.fromARGB(255, 129, 51, 213);
  static const Color inputBorder = Color(0Xfff3eef4);

  static ThemeData mainTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
    ),
  );
}
