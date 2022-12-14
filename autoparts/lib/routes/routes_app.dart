import 'package:autoparts/screens/screens.dart';
import 'package:flutter/material.dart';

class RoutesApp {
  static String home = "home";

  static Map<String, Widget Function(BuildContext)> routes = {
    RoutesApp.home: (p0) => const HomeScreen(),
  };
}
