import 'package:autoparts/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignInBackground extends StatelessWidget {
  final Widget child;

  const SignInBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: -60,
            child: Transform.rotate(
              angle: 310,
              child: Image.asset(
                AssetsApp.signUpTop,
                width: size.width * 0.4,
                color: ThemeApp.primary,
              ),
            ),
          ),
          Positioned(
            top: -size.height * 0.1,
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
              color: ThemeApp.primary,
            ),
          ),
          child
        ],
      ),
    );
  }
}
