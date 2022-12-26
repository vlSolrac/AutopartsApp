import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:flutter/material.dart';

import 'package:autoparts/widgets/widgets.dart';

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
      drawer: const DrawerCustom(),
      appBar: AppBar(
        title: const Text("My Cars"),

        // // leading: IconButton(
        // //   onPressed: () {
        //       // ZoomDrawer.of(context)!.toggle();
        // //   },
        // //   icon: const Icon(Icons.menu),
        // // ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RoutesApp.addCar);
        },
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return const CarCard();
        },
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  const CarCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: double.infinity,
        height: size.height * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 7),
              blurRadius: 5,
              spreadRadius: 2,
            )
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                foregroundDecoration:
                    const BoxDecoration(color: Colors.black12),
                width: double.infinity,
                height: double.infinity,
                child: const FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage(AssetsApp.jarLoading),
                  image: NetworkImage(
                      "https://m.media-amazon.com/images/I/7141gTSWNOL._AC_SX679_.jpg"),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width * 0.4,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                  color: ThemeApp.primary.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "name",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: size.height * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "year",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: size.height * 0.018,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: ThemeApp.white,
                  ),
                  splashRadius: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
