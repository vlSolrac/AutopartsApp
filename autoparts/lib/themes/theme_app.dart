import 'package:flutter/material.dart';

class ThemeApp {
  static Color primary = const Color(0xff02AAB0);
  static Color secondary = const Color(0xff00CDAC);

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
