import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddCarScreen extends StatelessWidget {
//Parametes.

  const AddCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //global variables.
    final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.4,
                    foregroundDecoration:
                        BoxDecoration(color: ThemeApp.black.withOpacity(0.1)),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 5),
                          blurRadius: 1,
                          spreadRadius: 5,
                        )
                      ],
                    ),
                    child: const FadeInImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://m.media-amazon.com/images/I/7141gTSWNOL._AC_SX679_.jpg"),
                      placeholder: AssetImage(AssetsApp.jarLoading),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.photo_camera)),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        TextFieldCustomer(
                          label: "Nombre del carro",
                          hint: "Stratus",
                          onChanged: (p0) {},
                        ),
                        TextFieldCustomer(
                          label: "Año",
                          hint: "2006",
                          onChanged: (p0) {},
                        ),
                        TextFieldCustomer(
                          label: "Motor",
                          hint: "2.4",
                          onChanged: (p0) {},
                        ),
                        TextFieldCustomer(
                          label: "Marca",
                          hint: "Dodge",
                          onChanged: (p0) {},
                        ),
                        TextFieldCustomer(
                          label: "label",
                          hint: "hint",
                          onChanged: (p0) {},
                        ),
                        TextFieldCustomer(
                          label: "label",
                          hint: "hint",
                          onChanged: (p0) {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
