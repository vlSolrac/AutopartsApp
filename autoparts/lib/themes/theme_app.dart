import 'package:flutter/material.dart';

class ThemeApp {
  static Color primary = const Color.fromARGB(255, 176, 22, 2);
  static Color secondary = const Color.fromARGB(255, 138, 17, 2);

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
