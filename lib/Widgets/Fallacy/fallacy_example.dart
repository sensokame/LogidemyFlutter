import 'package:flutter/material.dart';

class FallacyExample extends StatelessWidget{
  const FallacyExample({
    Key? key,
    required this.exampleText
  }) : super(key: key);
  final String exampleText;
  @override
  Widget build(BuildContext context) {
    return Text(
      exampleText,
      textAlign: TextAlign.left
    );
  }
}