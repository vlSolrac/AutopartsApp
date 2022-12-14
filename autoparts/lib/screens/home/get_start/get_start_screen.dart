import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/rounded_button.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:flutter/material.dart';
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
              const HeaderFistHome(),
              SizedBox(height: size.height * 0.06),
              LottieBuilder.asset(
                "assets/lotties/car_white.json",
                width: size.width * 0.95,
                repeat: true,
              ),
              SizedBox(height: size.height * 0.05),
              const RoudenButtonFistHome(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderFistHome extends StatelessWidget {
  const HeaderFistHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Autoparts",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.width * 0.08),
            ),
            SizedBox(height: size.height * 0.01),
            SizedBox(
              width: size.width * 0.7,
              child: Text(
                "",
                style: TextStyle(fontSize: size.width * 0.04),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoudenButtonFistHome extends StatelessWidget {
  const RoudenButtonFistHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: RoundedButton(
        onPressed: () => Navigator.popAndPushNamed(context, RoutesApp.login),
        color: ThemeApp.primary,
        fontSize: size.height * 0.024,
        text: "",
        paddingInside: size.height * 0.02,
      ),
    );
  }
}
