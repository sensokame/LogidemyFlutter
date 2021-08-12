import 'package:flutter/material.dart';

class ThemeCard extends StatefulWidget{
  const ThemeCard(
  {
    Key? key,
    required this.theme
  }) : super (key: key);
  final ThemeData theme;
  @override
  _ThemeCardState createState() => _ThemeCardState();
}
class _ThemeCardState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // for now return a box
    return
      const Card(
        color: Color.fromARGB(1, 0, 0, 255),
        child: IntrinsicHeight(),
      );
  }

}