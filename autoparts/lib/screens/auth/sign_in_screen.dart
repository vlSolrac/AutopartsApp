import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:autoparts/providers/providers.dart';
import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/screens/screens.dart';
import 'package:autoparts/services/services.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
//Parametes.

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //global variables.
    final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;

    return Scaffold(
      body: SignInBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.9,
                height: size.height * 0.5,
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
                  create: (context) => SignUpFormProvider(),
                  child: const SignInForm(),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ya tienes una cuenta? ",
                    style: TextStyle(fontSize: size.height * 0.02),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.popAndPushNamed(context, RoutesApp.login),
                    child: Text(
                      " Inicia Sesión",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.02,
                      ),
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

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final singInProvider = Provider.of<SignUpFormProvider>(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: singInProvider.formSignUp,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "REGISTRATE",
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
              onChanged: (value) => singInProvider.email = value,
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
            TextFieldCustomer(
              label: "Usuario",
              hint: "vlSolrac",
              keyboardType: TextInputType.text,
              suffixIcon: CupertinoIcons.person_fill,
              onChanged: (value) => singInProvider.username = value,
              validator: (value) => value!.isNotEmpty
                  ? null
                  : "El nombre de usuario es requerido",
            ),
            const SeparaterCustomer(),
            TextFieldCustomer(
              label: "Nombres",
              hint: "Carlos",
              keyboardType: TextInputType.text,
              suffixIcon: CupertinoIcons.person_fill,
              onChanged: (value) => singInProvider.name = value,
              validator: (value) =>
                  value!.isNotEmpty ? null : "El nombre es requerido",
            ),
            const SeparaterCustomer(),
            TextFieldCustomer(
              label: "Apellidos",
              hint: "Vela",
              keyboardType: TextInputType.text,
              suffixIcon: CupertinoIcons.person_fill,
              onChanged: (value) => singInProvider.lastName = value,
              validator: (value) => value!.isNotEmpty
                  ? null
                  : "El nombre de usuario es requerido",
            ),
            const SeparaterCustomer(),
            TextFieldPasswordCustomer(
              label: "Contraseña",
              hint: "**********",
              keyboardType: TextInputType.text,
              onChanged: (value) => singInProvider.password = value,
              validator: (value) => value != null && value.length >= 6
                  ? null
                  : 'La contraseña debe de ser de 6 caracteres',
            ),
            const SeparaterCustomer(),
            SizedBox(height: size.height * 0.02),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: singInProvider.isLoading
                  ? size.width * 0.3
                  : size.width * 0.72,
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
                  onPressed: singInProvider.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();

                          if (singInProvider.email.isEmpty) {
                            CustomSnackBar(
                                context, const Text("El email es requerido"),
                                backgroundColor: Colors.red);
                            // focusNodeEmail.requestFocus();
                            return;
                          }

                          if (singInProvider.password.isEmpty) {
                            CustomSnackBar(context,
                                const Text("La contraseña es requerida"),
                                backgroundColor: Colors.red);
                            // focusNodePassword.requestFocus();
                            return;
                          }

                          singInProvider.isLoading = true;

                          final authService =
                              Provider.of<AuthService>(context, listen: false);

                          final res = await authService.loginUser(
                              singInProvider.email, singInProvider.password);

                          if (!res!.flag) {
                            // ignore: use_build_context_synchronously
                            CustomSnackBar(context, Text(res.message),
                                backgroundColor: Colors.red);
                            singInProvider.isLoading = false;
                            return;
                          }

                          // ignore: use_build_context_synchronously
                          CustomSnackBar(context, Text(res.message));

                          // ignore: use_build_context_synchronously
                          Navigator.popAndPushNamed(context, RoutesApp.car);

                          singInProvider.isLoading = false;
                        },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 42.0,
                    ),
                    child: singInProvider.isLoading
                        ? SpinKitSpinningLines(
                            color: Colors.white,
                            size: size.height * 0.03,
                          )
                        : const Text(
                            'REGISTRARSE',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0),
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
          ],
        ),
      ),
    );
  }
}
