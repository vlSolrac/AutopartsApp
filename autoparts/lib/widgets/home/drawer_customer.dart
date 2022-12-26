import 'package:flutter/material.dart';

import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/services/services.dart';
import 'package:provider/provider.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authService = Provider.of<AuthService>(context);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  radius: size.width * 0.13,
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  authService.currentUser.nickname,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.021),
                )
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: size.width * 0.7,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.person),
                      Text(
                        "Perfil",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                GestureDetector(
                  onTap: () async {},
                  child: Row(
                    children: const [
                      Icon(Icons.settings),
                      Text(
                        "Ajustes",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                GestureDetector(
                  onTap: () async {
                    await authService.logout();
                    // ignore: use_build_context_synchronously
                    Navigator.popAndPushNamed(context, RoutesApp.getStart);
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.logout),
                      Text(
                        "Cerrar Sesión",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 5),
          Container(
            width: double.infinity,
            height: size.height * 0.2,
            color: ThemeApp.primary,
          )
        ],
      ),
    );
  }
}
