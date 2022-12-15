import 'package:flutter/material.dart';

import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/widgets.dart';

class GetSatartRoudenButton extends StatelessWidget {
  const GetSatartRoudenButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: RoundedButton(
        onPressed: () => Navigator.popAndPushNamed(context, RoutesApp.auth),
        color: ThemeApp.primary,
        fontSize: size.height * 0.024,
        text: "INICIAR",
        paddingInside: size.height * 0.02,
      ),
    );
  }
}
