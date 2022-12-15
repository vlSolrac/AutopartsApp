import 'package:flutter/material.dart';

import 'package:autoparts/screens/screens.dart';

class RoutesApp {
  static String splash = "splash";
  static String getStart = "get_start";
  static String auth = "auth";
  static String home = "home";
  static String car = "car";
  static String addCar = "addCar";
  static String addCarPart = "addCarPart";
  static String detailCar = "detailCar";
  static String detailCarPart = "detailCarPart";

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (p0) => const HomeScreen(),
    car: (p0) => const CarScreen(),
    getStart: (p0) => const GetStartScreen(),
    splash: (p0) => const SplashScreen(),
    auth: (p0) => const AuthScreen(),
    addCar: (p0) => const AddCarScreen(),
    addCarPart: (p0) => const AddPartCarScreen(),
    detailCar: (p0) => const CarDetailScreen(),
    detailCarPart: (p0) => const CarPartDetailScreen()
  };
}
