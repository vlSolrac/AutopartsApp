import 'package:flutter/material.dart';

class MyDrawer {
  String text;
  IconData icon;
  bool selected;
  Function()? onPressed;

  MyDrawer({
    required this.text,
    required this.icon,
    this.onPressed,
    required this.selected,
  });

  static List<MyDrawer> drawerList = [
    MyDrawer(text: "Home", icon: Icons.home, selected: true),
    MyDrawer(text: "Perfil", icon: Icons.person, selected: false),
    MyDrawer(text: "Ajustes", icon: Icons.settings, selected: false),
    MyDrawer(text: "Cerrar Sesión", icon: Icons.logout, selected: false),
  ];
}
