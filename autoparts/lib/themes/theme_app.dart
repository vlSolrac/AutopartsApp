import 'package:flutter/material.dart';

class ThemeApp {
  static Color primary = const Color.fromARGB(255, 176, 22, 2);
  static Color secondary = const Color.fromARGB(255, 138, 17, 2);

  static const Color loginGradientStart = Color(0xFFfbab66);
  static const Color loginGradientEnd = Color(0xFFf7418c);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: primary,
      elevation: 0,
      centerTitle: true,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      color: primary,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
