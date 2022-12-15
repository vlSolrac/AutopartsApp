import 'package:flutter/material.dart';

import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:lottie/lottie.dart';

class GetStartScreen extends StatelessWidget {
//Parametes.

  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //global variables.
    final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;

    return Scaffold(
      body: GetStartBackgroud(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const GetStartHeader(),
              SizedBox(height: size.height * 0.06),
              LottieBuilder.asset(
                AssetsApp.carWhite,
                width: size.width * 0.95,
                repeat: true,
              ),
              SizedBox(height: size.height * 0.05),
              const GetSatartRoudenButton(),
            ],
          ),
        ),
      ),
    );
  }
}

