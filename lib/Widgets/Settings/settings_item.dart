import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget{
  const SettingsItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap
  }) : super (key: key);
  final String text;
  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // icon
        Icon(icon),
        // button with text,
        TextButton(
            onPressed: onTap,
            child: Text(text)
        )
      ],
    );
  }

}