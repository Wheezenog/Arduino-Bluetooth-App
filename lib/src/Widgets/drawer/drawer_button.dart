// ignore: must_be_immutable
import 'package:flutter/material.dart';

/// Create a new button with given inputs.
///
/// **Required Fields:**
/// * [icon] The icon to be used with the button.
/// * [text] The text that will show next to the button
/// * [route] the route of the page that the button will redirect to.
///
///  ``` dart
/// CustomIconButton(icon: Icons.(icon), text: 'Some Text', route: ClassName.routeName)
/// ```

class CustomIconButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final String? route;

  const CustomIconButton(
      {super.key, required this.icon, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
          onTap: () {
            Navigator.restorablePushNamed(context, route!);
          },
          child: Row(
            children: [
              Icon(
                (icon),
                size: 35,
              ),
              const SizedBox(width: 8),
              Text(text!, style: const TextStyle(fontSize: 14),)
            ],
          )),
    );
  }
}
