import 'package:arduinohc06/src/Pages/devices.dart';
import 'package:arduinohc06/src/Pages/home_page.dart';
import 'package:arduinohc06/src/Widgets/drawer/drawer_button.dart';
import 'package:flutter/material.dart';

///creates a new [Drawer] widget populated with buttons created using the [drawer_button] class
class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      width: 200,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: SafeArea(
            child: Column(
              children: [
                // Home button.
                CustomIconButton(icon: Icons.home, text: 'Home', route: HomePage.routeName),
                // Scouting Button.
                CustomIconButton(icon: Icons.devices, text: 'Devices', route: Devices.routeName),
                // Data view.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
