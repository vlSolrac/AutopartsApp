import 'package:autoparts/themes/themes.dart';
import 'package:flutter/material.dart';

class TextFieldCustomer extends StatefulWidget {
  final String label;
  final String hint;
  final IconData? suffixIcon;
  final IconData? preffixIcon;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  // final FocusNode focusNode;

  const TextFieldCustomer({
    Key? key,
    required this.label,
    required this.hint,
    this.suffixIcon,
    this.preffixIcon,
    this.onChanged,
    this.keyboardType,
    this.validator,
    // required this.focusNode,
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
