import 'package:autoparts/providers/auth/login_form_provider.dart';
import 'package:autoparts/screens/auth/sign_up.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
    final loginProvider = Provider.of<LoginFormProvider>(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.only(top: 10.0),
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
                      key: loginProvider.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              onChanged: (value) {
                                loginProvider.email = value;
                              },
                              onSubmitted: (_) {
                                focusNodePassword.requestFocus();
                              },
                            ),
                          ),
                          const SeparaterCustomer(),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                              left: 25.0,
                              right: 25.0,
                            ),
                            child: TextField(
                              focusNode: focusNodePassword,
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
                              onChanged: (value) {
                                loginProvider.password = value;
                                print(loginProvider.password);
                              },
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
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: loginProvider.isLoading
                      ? size.width * 0.3
                      : size.width * 0.65,
                  margin: EdgeInsets.only(top: size.height * 0.28),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
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
                        colors: [
                          ThemeApp.loginGradientEnd,
                          ThemeApp.loginGradientStart
                        ],
                        begin: FractionalOffset(0.2, 0.2),
                        end: FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: ThemeApp.loginGradientEnd,
                    onPressed: !loginProvider.isLoading
                        ? null
                        : () {
                            loginProvider.isValidForm();
                            // CustomSnackBar(
                            //   context,
                            //   const Text('Login button pressed'),
                            // );
                          },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 42.0,
                      ),
                      child: loginProvider.isLoading
                          ? SpinKitSpinningLines(
                              color: Colors.white,
                              size: size.height * 0.03,
                            )
                          : const Text(
                              'INGRESAR',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                    ),
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
