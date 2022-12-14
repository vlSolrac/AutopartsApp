import 'package:flutter/material.dart';

// import 'package:autoparts/routes/routes_app.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CarScreen extends StatelessWidget {
//Parametes.

  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //global variables.
    // final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cars"),
        // // leading: IconButton(
        // //   onPressed: () {
        //       // ZoomDrawer.of(context)!.toggle();
        // //   },
        // //   icon: const Icon(Icons.menu),
        // // ),
      ),
      body: Center(
        child: Text('CarScreen'),
      ),
    );
  }
}
