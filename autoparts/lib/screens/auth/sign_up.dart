import 'package:autoparts/providers/providers.dart';
import 'package:autoparts/services/services.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final signProvider = Provider.of<SignUpFormProvider>(context);

    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                    // height: size.height * 0.5,
                    child: Form(
                      key: signProvider.formSignUp,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          TextFieldCustomer(
                            hint: "vlSolrac",
                            label: "Nombre de Usuario",
                            suffixIcon: Icons.person_rounded,
                            keyboardType: TextInputType.text,
                            onChanged: (value) => signProvider.username = value,
                          ),
                          const SeparaterCustomer(),
                          TextFieldCustomer(
                            hint: "Carlos",
                            label: "Nombre",
                            suffixIcon: Icons.person_rounded,
                            keyboardType: TextInputType.text,
                            onChanged: (value) => signProvider.name = value,
                          ),
                          const SeparaterCustomer(),
                          TextFieldCustomer(
                            hint: "Vela",
                            label: "Apellidos",
                            suffixIcon: Icons.person_rounded,
                            keyboardType: TextInputType.text,
                            onChanged: (value) => signProvider.lastName = value,
                          ),
                          const SeparaterCustomer(),
                          TextFieldCustomer(
                            hint: "Carlos@gmail.com",
                            label: "Correo electronico",
                            suffixIcon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) => signProvider.email = value,
                            // validator: (value) {
                            //   String pattern =
                            //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{3,}))$';
                            //   RegExp regExp = RegExp(pattern);

                            //   if (regExp.hasMatch(value ?? '')) {
                            //     return null;
                            //   } else {
                            //     return 'El valor ingresado no luce como un correo';
                            //   }
                            // },
                          ),
                          const SeparaterCustomer(),
                          TextFieldPasswordCustomer(
                            hint: "*******",
                            label: "Contrase;a",
                            keyboardType: TextInputType.text,
                            onChanged: (value) => signProvider.password = value,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: signProvider.isLoading
                      ? size.width * 0.3
                      : size.width * 0.8,
                  margin: EdgeInsets.only(top: size.height * 0.62),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                  child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: ThemeApp.primary,
                    onPressed: signProvider.isLoading
                        ? null
                        : () async {
                            FocusScope.of(context).unfocus();

                            if (signProvider.email.isEmpty) {
                              CustomSnackBar(
                                  context, const Text("El email es requerido"),
                                  backgroundColor: Colors.red);
                              return;
                            }

                            if (signProvider.email.isNotEmpty) {
                              String pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regExp = RegExp(pattern);

                              regExp.hasMatch(signProvider.email)
                                  ? null
                                  : CustomSnackBar(
                                      context,
                                      const Text(
                                          "El email no luce como un correo correcto"),
                                      backgroundColor: Colors.red);
                            }

                            if (signProvider.password.isEmpty ||
                                signProvider.password.length < 6) {
                              CustomSnackBar(
                                  context,
                                  const Text(
                                      "La contraseña es requerida y debe tener mas de 6 caracteres"),
                                  backgroundColor: Colors.red);
                              return;
                            }

                            if (signProvider.username.isEmpty) {
                              CustomSnackBar(
                                  context,
                                  const Text(
                                      "El nombre de usuario es requerida"),
                                  backgroundColor: Colors.red);
                              return;
                            }

                            if (signProvider.name.isEmpty) {
                              CustomSnackBar(
                                  context, const Text("El nombre es requerida"),
                                  backgroundColor: Colors.red);
                              return;
                            }

                            if (signProvider.lastName.isEmpty) {
                              CustomSnackBar(context,
                                  const Text("El apellido es requerida"),
                                  backgroundColor: Colors.red);
                              return;
                            }

                            signProvider.isLoading = true;
                            final authService = Provider.of<AuthService>(
                                context,
                                listen: false);
                            final res = await authService.createUser(
                                email: signProvider.email,
                                password: signProvider.password,
                                name: signProvider.name,
                                middlename: signProvider.lastName,
                                nickname: signProvider.username);

                            if (!res!.flag) {
                              // ignore: use_build_context_synchronously
                              CustomSnackBar(context, Text(res.message),
                                  backgroundColor: Colors.red);

                              return;
                            }

                            signProvider.isLoading = false;
                          },
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 42.0,
                      ),
                      child: signProvider.isLoading
                          ? SpinKitSpinningLines(
                              color: Colors.white,
                              size: size.height * 0.03,
                            )
                          : const Text(
                              'REGISTRARSE',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}