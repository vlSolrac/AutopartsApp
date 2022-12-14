import 'package:flutter/material.dart';

import 'package:autoparts/models/home/models.dart';
import 'package:autoparts/screens/screens.dart';

import 'package:autoparts/themes/themes.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MenuItemm currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      showShadow: true,
      menuBackgroundColor: ThemeApp.primary,
      mainScreenScale: 0.1,
      slideWidth: 250,
      angle: 0,
      menuScreen: MenuScreen(
        currentItem: currentItem,
        onSelectItem: (item) {
          currentItem = item;
          setState(() {});
        },
      ),
      mainScreen: const CarScreen(),
    );
  }

  // getScreen() {
  //   switch (currentItem) {
  //     case MenuItems.home:
  //       break;
  //   }
  // }
}

class MenuScreen extends StatelessWidget {
  final MenuItemm currentItem;
  final Function(MenuItemm) onSelectItem;

  const MenuScreen({
    super.key,
    required this.currentItem,
    required this.onSelectItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeApp.primary,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "vlSolrac",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            ...MenuItems.allMenus.map(buildMenuItem).toList(),
            const Spacer(flex: 5)
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItemm item) => ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selectedColor: Colors.black,
          selected: currentItem.name == item.name,
          minLeadingWidth: 20,
          leading: Icon(
            item.icon,
            color: Colors.white,
          ),
          title: Text(
            item.name,
            // style: const TextStyle(
            //     color: Colors.white, fontWeight: FontWeight.bold),
          ),
          onTap: () => onSelectItem(item),
        ),
      );
}

class MenuItems {
  static var home =  MenuItemm(name: "Home", icon: Icons.home);
  static MenuItemm settings = MenuItemm(name: "Settings", icon: Icons.settings);
  static MenuItemm profile = MenuItemm(name: "Profile", icon: Icons.person);

  static List<MenuItemm> allMenus = [home, profile, settings];
}
