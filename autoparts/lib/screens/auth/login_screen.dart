import 'package:flutter/material.dart';

import 'package:autoparts/providers/providers.dart';
import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/screens/screens.dart';
import 'package:autoparts/services/services.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
//Parametes.

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //global variables.
    final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;

    return Scaffold(
      body: LoginBackground(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ChangeNotifierProvider(
                  create: (context) => LoginFormProvider(),
                  child: const LoginForm(),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Aun no tienes una cuenta? ",
                    style: TextStyle(fontSize: size.height * 0.02),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.popAndPushNamed(context, RoutesApp.signIn),
                    child: Text(
                      " Registrate",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.02),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginProvider.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.04,
              ),
            ),
          ),
          TextFieldCustomer(
            label: "Correo electronico",
            hint: "Carlos@gmail.com",
            keyboardType: TextInputType.emailAddress,
            suffixIcon: Icons.person,
            onChanged: (value) => loginProvider.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El valor ingresado no luce como un correo';
            },
          ),
          const SeparaterCustomer(),
          TextFieldPasswordCustomer(
            label: "Contraseña",
            hint: "**********",
            keyboardType: TextInputType.text,
            onChanged: (value) => loginProvider.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La contraseña debe de ser de 6 caracteres';
            },
          ),
          const SeparaterCustomer(),
          SizedBox(height: size.height * 0.02),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width:
                loginProvider.isLoading ? size.width * 0.3 : size.width * 0.65,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              boxShadow: [
                BoxShadow(
                  color: ThemeApp.primary,
                  offset: const Offset(1.0, 6.0),
                  spreadRadius: 2,
                  blurRadius: 10.0,
                ),
                BoxShadow(
                  color: ThemeApp.primaryDark,
                  offset: const Offset(1.0, 6.0),
                  spreadRadius: 2,
                  blurRadius: 10.0,
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  ThemeApp.primary,
                  ThemeApp.primaryDark,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
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
                          CustomSnackBar(
                              context, const Text("El email es requerido"),
                              backgroundColor: Colors.red);
                          // focusNodeEmail.requestFocus();
                          return;
                        }

                        if (loginProvider.password.isEmpty) {
                          CustomSnackBar(
                              context, const Text("La contraseña es requerida"),
                              backgroundColor: Colors.red);
                          // focusNodePassword.requestFocus();
                          return;
                        }

                        loginProvider.isLoading = true;

                        final authService =
                            Provider.of<AuthService>(context, listen: false);

                        final res = await authService.loginUser(
                            loginProvider.email, loginProvider.password);

                        if (!res!.flag) {
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
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.04),
        ],
      ),
    );
  }
}
