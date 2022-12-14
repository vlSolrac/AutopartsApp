import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
//Parametes.

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool hasUser = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) => {
          if (hasUser)
            {Navigator.pushReplacementNamed(context, RoutesApp.home)}
          else
            {Navigator.pushReplacementNamed(context, RoutesApp.getStart)}
        });
  }

  @override
  Widget build(BuildContext context) {
    //global variables.
    final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;

    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SafeArea(
            child: ImageAnimation(
              image: const AssetImage(AssetsApp.carComponents),
              imageHeight: size.height * 0.45,
            ),
          ),
          const Spacer(flex: 4),
          SpinKitHourGlass(
            color: ThemeApp.primary,
            size: size.height * 0.09,
          ),
          const Spacer(flex: 2)
        ],
      ),
    ));
  }
}
