import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/services/services.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:autoparts/routes/routes_app.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CarScreen extends StatelessWidget {
//Parametes.

  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //global variables.
    final size = MediaQuery.of(context).size;
    final authService = Provider.of<AuthService>(context);
    // final statusBar = MediaQuery.of(context).viewPadding;

    return Scaffold(
      drawer: Drawer(
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
                    "User Name",
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
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.person)),
                      const Text(
                        "Perfil",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () async {
                            print("object");
                            await authService.logout();
                            // ignore: use_build_context_synchronously
                            Navigator.popAndPushNamed(context, RoutesApp.auth);
                          },
                          icon: const Icon(Icons.logout)),
                      const Text(
                        "Cerrar Sesión",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
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
      ),
      appBar: AppBar(
        title: const Text("My Cars"),
        // // leading: IconButton(
        // //   onPressed: () {
        //       // ZoomDrawer.of(context)!.toggle();
        // //   },
        // //   icon: const Icon(Icons.menu),
        // // ),
      ),
      body: const Center(
        child: Text('CarScreen'),
      ),
    );
  }
}
