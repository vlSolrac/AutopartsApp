import 'package:flutter/material.dart';

import 'package:autoparts/themes/themes.dart';
import 'package:lottie/lottie.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;

  const LoginBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              AssetsApp.mainTop,
              width: size.width * 0.35,
              color: ThemeApp.primary,
            ),
          ),
          Positioned(
            top: -size.height * 0.04,
            child: LottieBuilder.asset(
              AssetsApp.carMoving,
              width: size.height * 0.5,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              AssetsApp.mainBottom,
              width: size.width * 0.3,
              color: ThemeApp.primaryDark,
            ),
          ),
          child
        ],
      ),
    );
  }
}
