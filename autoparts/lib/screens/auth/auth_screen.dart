import 'package:autoparts/screens/auth/sign_in.dart';
import 'package:autoparts/screens/auth/sign_up.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthScreen extends StatefulWidget {
//Parametes.

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    //global variables.
    final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;
    return Scaffold();
  }
}
