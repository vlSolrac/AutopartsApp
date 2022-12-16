import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  bool _obscureTextPassword = true;

  @override
  void initState() {
    super.initState();
    focusNodeEmail.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.only(top: 23.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Card(
                  elevation: 3.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: SizedBox(
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                              left: 25.0,
                              right: 25.0,
                            ),
                            child: TextField(
                              focusNode: focusNodeEmail,
                              controller: loginEmailController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: const Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 22.0,
                                ),
                                // labelText: 'Correo electronico',
                                label: Text(
                                  "Correo electronico",
                                  style: TextStyle(
                                    color: focusNodeEmail.hasFocus
                                        ? ThemeApp.primary
                                        : ThemeApp.black,
                                  ),
                                ),
                                hintText: 'Carlos@gmail.com',
                                hintStyle: const TextStyle(fontSize: 17.0),
                              ),
                              onSubmitted: (_) {
                                focusNodePassword.requestFocus();
                              },
                            ),
                          ),
                          Container(
                              width: 250.0,
                              height: 1.0,
                              color: Colors.grey[400]),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0,
                                bottom: 20.0,
                                left: 25.0,
                                right: 25.0),
                            child: TextField(
                              focusNode: focusNodePassword,
                              controller: loginPasswordController,
                              obscureText: _obscureTextPassword,
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: const Icon(
                                  Icons.lock,
                                  size: 22.0,
                                  color: Colors.black,
                                ),
                                hintText: '********',
                                label: Text(
                                  "Contraseña",
                                  style: TextStyle(
                                    color: focusNodePassword.hasFocus
                                        ? ThemeApp.primary
                                        : ThemeApp.black,
                                  ),
                                ),
                                hintStyle: const TextStyle(fontSize: 17.0),
                                suffixIcon: GestureDetector(
                                  onTap: _toggleLogin,
                                  child: Icon(
                                    _obscureTextPassword
                                        ? Icons.remove_red_eye
                                        : Icons.remove_red_eye_outlined,
                                    size: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              onSubmitted: (_) {
                                _toggleSignInButton();
                              },
                              textInputAction: TextInputAction.go,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:  EdgeInsets.only(top: size.height * 0.27),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: ThemeApp.loginGradientStart,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                      BoxShadow(
                        color: ThemeApp.loginGradientEnd,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                    ],
                    gradient: LinearGradient(
                        colors: <Color>[
                          ThemeApp.loginGradientEnd,
                          ThemeApp.loginGradientStart
                        ],
                        begin: FractionalOffset(0.2, 0.2),
                        end: FractionalOffset(1.0, 1.0),
                        stops: <double>[0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: ThemeApp.loginGradientEnd,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        'ENTRAR',
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                    onPressed: () => CustomSnackBar(
                        context, const Text('Login button pressed')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _toggleSignInButton() {
    CustomSnackBar(context, const Text('Login button pressed'));
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
