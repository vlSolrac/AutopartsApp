import 'package:autoparts/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFieldPasswordAuth extends StatefulWidget {
  final String label;
  final String hintText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const FormFieldPasswordAuth({
    Key? key,
    required this.label,
    required this.hintText,
    this.onChanged,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  State<FormFieldPasswordAuth> createState() => _FormFieldPasswordAuthState();
}

class _FormFieldPasswordAuthState extends State<FormFieldPasswordAuth> {
  late FocusNode _focusNode;
  bool showPassword = false;
  @override
  void dispose() {
    _focusNode.dispose();
    // _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // _pageController = PageController();
    _focusNode = FocusNode()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      focusNode: _focusNode,
      obscureText: showPassword,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.label,
        labelStyle: TextStyle(color: ThemeApp.primary),
        suffixIcon: IconButton(
          color: _focusNode.hasFocus ? ThemeApp.primary : Colors.grey,
          onPressed: () {
            showPassword = !showPassword;
            setState(() {});
          },
          icon: Icon(showPassword
              ? CupertinoIcons.eye_solid
              : CupertinoIcons.eye_slash_fill),
        ),
        prefixIcon: Icon(
          CupertinoIcons.lock_fill,
          color: _focusNode.hasFocus ? ThemeApp.primary : Colors.grey,
        ),
        prefixIconColor: ThemeApp.primary,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: ThemeApp.primary,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: ThemeApp.primary,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: ThemeApp.primary,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: ThemeApp.primary,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}

class FormFieldAuth extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData? icon;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const FormFieldAuth({
    Key? key,
    required this.label,
    required this.hintText,
    this.onChanged,
    this.keyboardType,
    this.validator,
    this.icon,
  }) : super(key: key);

  @override
  State<FormFieldAuth> createState() => _FormFieldAuthState();
}

class _FormFieldAuthState extends State<FormFieldAuth> {
  
  late FocusNode _focusNode;

  @override
  void dispose() {
    _focusNode.dispose();
    // _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // _pageController = PageController();
    _focusNode = FocusNode()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.label,
        labelStyle: TextStyle(color: ThemeApp.primary),
        prefixIcon: Icon(
          widget.icon,
          color: _focusNode.hasFocus ? ThemeApp.primary : Colors.grey,
        ),
        prefixIconColor: ThemeApp.primary,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: ThemeApp.primary,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: ThemeApp.primary,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: ThemeApp.primary,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: ThemeApp.primary,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
