import 'package:flutter/material.dart';

import 'package:autoparts/providers/providers.dart';
import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/services/services.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  final TextEditingController controller = TextEditingController();

  bool _obscureTextPassword = true;

  @override
  void initState() {
    super.initState();
    focusNodeEmail.addListener(() {
      setState(() {});
    });

    focusNodePassword.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    controller.dispose();
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
                            child: TextFormField(
                              focusNode: focusNodeEmail,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.email,
                                  color: focusNodeEmail.hasFocus
                                      ? ThemeApp.primary
                                      : ThemeApp.black,
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
                            child: TextFormField(
                              focusNode: focusNodePassword,
                              controller: controller,
                              obscureText: _obscureTextPassword,
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.lock,
                                  size: 22.0,
                                  color: focusNodePassword.hasFocus
                                      ? ThemeApp.primary
                                      : ThemeApp.black,
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
                                    color: focusNodePassword.hasFocus
                                        ? ThemeApp.primary
                                        : ThemeApp.black,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                loginProvider.password = value;
                              },
                              textInputAction: TextInputAction.go,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // height: size.height * 0.3,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: loginProvider.isLoading
                      ? size.width * 0.3
                      : size.width * 0.65,
                  margin: EdgeInsets.only(top: size.height * 0.26),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                      BoxShadow(
                        color: Colors.blue,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                    ],
                    gradient: LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.green,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: ThemeApp.primary,
                      onPressed: loginProvider.isLoading
                          ? null
                          : () async {
                              FocusScope.of(context).unfocus();

                              if (loginProvider.email.isEmpty) {
                                CustomSnackBar(context,
                                    const Text("El email es requerido"),
                                    backgroundColor: Colors.red);
                                // focusNodeEmail.requestFocus();
                                return;
                              }

                              if (loginProvider.password.isEmpty) {
                                CustomSnackBar(context,
                                    const Text("La contraseña es requerida"),
                                    backgroundColor: Colors.red);
                                // focusNodePassword.requestFocus();
                                return;
                              }

                              loginProvider.isLoading = true;

                              final authService = Provider.of<AuthService>(
                                  context,
                                  listen: false);

                              final res = await authService.loginUser(
                                  loginProvider.email, loginProvider.password);

                              if (!res.flag) {
                                // ignore: use_build_context_synchronously
                                CustomSnackBar(context, Text(res.message),
                                    backgroundColor: Colors.red);
                                loginProvider.isLoading = false;
                                return;
                              }

                              // ignore: use_build_context_synchronously
                              CustomSnackBar(context, Text(res.message));

                              // ignore: use_build_context_synchronously
                              Navigator.popAndPushNamed(context, RoutesApp.car);

                              loginProvider.isLoading = false;
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
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25.0),
                              ),
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

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
