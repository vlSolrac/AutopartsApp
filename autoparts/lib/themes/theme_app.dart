import 'package:flutter/material.dart';

class ThemeApp {
  static Color primary = const Color.fromARGB(255, 3, 121, 218);
  // static Color primary = const Color(0xff0303b5);
  static Color primaryDark = const Color.fromARGB(255, 1, 70, 126);

  static Color secondary =  const Color.fromARGB(255, 42, 187, 47);
  static Color secondaryDark =  const Color.fromARGB(255, 4, 119, 8);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);


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
