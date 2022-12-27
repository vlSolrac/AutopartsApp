import 'package:autoparts/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarFieldCustomer extends StatefulWidget {
  final String label;
  final String hint;
  final IconData? suffixIcon;
  final IconData? preffixIcon;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  // final FocusNode focusNode;

  const CalendarFieldCustomer({
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
  State<CalendarFieldCustomer> createState() => _CalendarFieldCustomerState();
}

class _CalendarFieldCustomerState extends State<CalendarFieldCustomer> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();

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
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 25.0,
        right: 25.0,
      ),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: TextInputType.datetime,
        textCapitalization: TextCapitalization.words,
        autocorrect: false,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            CupertinoIcons.calendar,
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
        validator: (value) {
          if (value == null) return null;

          if (value.contains("-")) {
            return "Se debe separar por -> /";
          }
        },
      ),
    );
  }
}
