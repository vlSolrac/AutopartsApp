import 'package:flutter/material.dart';

import 'package:autoparts/widgets/widgets.dart';

class GetSatartRoudenButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function()? onPressed;
  const GetSatartRoudenButton({
    Key? key,
    required this.text,
    this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RoundedButton(
        onPressed: onPressed,
        color: color,
        fontSize: size.height * 0.024,
        text: text,
        paddingInside: size.height * 0.02,
      ),
    );
  }
}
