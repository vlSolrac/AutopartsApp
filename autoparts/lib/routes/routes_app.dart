import 'package:flutter/material.dart';

import 'package:autoparts/screens/screens.dart';

class RoutesApp {
  static String home = "home";
  static String car = "car";
  static String splash = "splash";
  static String getStart = "get_start";
  static String detailCar = "detailCar";
  static String addCar = "addCar";
  static String addCarPart = "addCarPart";
  static String login = "login";
  static String signup = "signup";
  static String detailCarPart = "detailCarPart";

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (p0) => const HomeScreen(),
    car: (p0) => const CarScreen(),
    getStart: (p0) => const GetStartScreen(),
    splash: (p0) => const SplashScreen(),
    login: (p0) => const LoginScreen(),
    signup: (p0) => const SignupScreen(),
    addCar: (p0) => const AddCarScreen(),
    addCarPart: (p0) => const AddPartCarScreen(),
    detailCar: (p0) => const CarDetailScreen(),
    detailCarPart: (p0) => const CarPartDetailScreen()
  };
}
