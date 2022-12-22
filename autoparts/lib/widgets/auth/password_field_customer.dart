import 'package:autoparts/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            Icons.lock,
            color: focusNode.hasFocus ? ThemeApp.primary : ThemeApp.black,
          ),
          label: Text(
            widget.label,
            style: TextStyle(
              color: focusNode.hasFocus ? ThemeApp.primary : ThemeApp.black,
            ),
          ),
          hintText: 'Contraseña',
          hintStyle: const TextStyle(
            fontSize: 16.0,
          ),
          suffixIcon: GestureDetector(
            onTap: _toggleSignup,
            child: Icon(
              _obscureTextPassword
                  ? Icons.remove_red_eye
                  : Icons.remove_red_eye_outlined,
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
