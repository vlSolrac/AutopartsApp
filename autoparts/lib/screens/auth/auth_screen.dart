import 'package:autoparts/screens/auth/sign_in.dart';
import 'package:autoparts/screens/auth/sign_up.dart';
import 'package:autoparts/screens/screens.dart';
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
  bool isSignup = false;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(AssetsApp.carBlack),
              _buildMenuBar(context),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.4,
                child: PageView(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int i) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (i == 0) {
                      setState(() {
                        isSignup = false;
                        right = Colors.white;
                        left = Colors.black;
                      });
                    } else if (i == 1) {
                      setState(() {
                        isSignup = true;
                        right = Colors.black;
                        left = Colors.white;
                      });
                    }
                  },
                  children: const [
                    SignIn(),
                    SignUp(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.07,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
            right: isSignup ? 0 : size.width * 0.45,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceOut,
              width: size.width * 0.45,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: _onSignInButtonPress,
                  child: Text(
                    'Entrar',
                    style: TextStyle(color: left, fontSize: 16.0),
                  ),
                ),
              ),
              //Container(height: 33.0, width: 1.0, color: Colors.white),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: _onSignUpButtonPress,
                  child: Text(
                    'Crear cuenta',
                    style: TextStyle(color: right, fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
    isSignup = false;
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
    isSignup = true;
  }
}
