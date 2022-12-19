import 'package:autoparts/providers/providers.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                            onChanged: (value) => signProvider.email,
                            validator: (value) {
                              String pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{3,}))$';
                              RegExp regExp = RegExp(pattern);

                              if (regExp.hasMatch(value ?? '')) {
                                return null;
                              } else {
                                return 'El valor ingresado no luce como un correo';
                              }
                            },
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
                            signProvider.isValidForm();
                            signProvider.isLoading = true;
                            await Future.delayed(
                                const Duration(milliseconds: 1000));
                            // ignore: use_build_context_synchronously
                            CustomSnackBar(
                              context,
                              const Text('Login button pressed'),
                            );
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

  void _toggleSignUpButton() {
    CustomSnackBar(context, const Text('SignUp button pressed'));
  }
}

class TextFieldPasswordCustomer extends StatefulWidget {
  final String label;
  final String hint;
  final IconData? suffixIcon;
  final IconData? preffixIcon;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const TextFieldPasswordCustomer({
    Key? key,
    required this.label,
    required this.hint,
    this.suffixIcon,
    this.preffixIcon,
    this.onChanged,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  State<TextFieldPasswordCustomer> createState() =>
      _TextFieldPasswordCustomerState();
}

class _TextFieldPasswordCustomerState extends State<TextFieldPasswordCustomer> {
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  bool _obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
        left: 25.0,
        right: 25.0,
      ),
      child: TextFormField(
        obscureText: _obscureTextPassword,
        autocorrect: false,
        focusNode: focusNode,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            FontAwesomeIcons.lock,
            color: focusNode.hasFocus ? ThemeApp.primary : ThemeApp.black,
          ),
          hintText: 'Contraseña',
          hintStyle: const TextStyle(
            fontSize: 16.0,
          ),
          suffixIcon: GestureDetector(
            onTap: _toggleSignup,
            child: Icon(
              _obscureTextPassword
                  ? FontAwesomeIcons.eye
                  : FontAwesomeIcons.eyeSlash,
              size: 15.0,
              color: focusNode.hasFocus ? ThemeApp.primary : ThemeApp.black,
            ),
          ),
        ),
        onChanged: widget.onChanged,
        validator: widget.validator,
      ),
    );
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}

class SeparaterCustomer extends StatelessWidget {
  const SeparaterCustomer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 1.0,
      color: Colors.grey[400],
    );
  }
}

class TextFieldCustomer extends StatefulWidget {
  final String label;
  final String hint;
  final IconData? suffixIcon;
  final IconData? preffixIcon;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const TextFieldCustomer({
    Key? key,
    required this.label,
    required this.hint,
    this.suffixIcon,
    this.preffixIcon,
    this.onChanged,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  State<TextFieldCustomer> createState() => _TextFieldCustomerState();
}

class _TextFieldCustomerState extends State<TextFieldCustomer> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
        left: 25.0,
        right: 25.0,
      ),
      child: TextFormField(
        focusNode: focusNode,
        keyboardType: widget.keyboardType,
        textCapitalization: TextCapitalization.words,
        autocorrect: false,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            widget.suffixIcon,
            color: focusNode.hasFocus ? ThemeApp.primary : ThemeApp.black,
          ),
          label: Text(
            widget.label,
            style: TextStyle(
              color: focusNode.hasFocus ? ThemeApp.primary : ThemeApp.black,
            ),
          ),
          hintText: widget.hint,
          hintStyle: const TextStyle(fontSize: 16.0),
        ),
        onChanged: widget.onChanged,
        validator: widget.validator,
      ),
    );
  }
}
