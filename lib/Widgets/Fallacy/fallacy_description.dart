import 'package:flutter/material.dart';

class FallacyDescription extends StatelessWidget{
  const FallacyDescription({
    Key? key,
    required this.descriptionText
  }) : super(key: key);
  final String descriptionText;
  @override
  Widget build(BuildContext context) {
    return Text(
        descriptionText,
        textAlign: TextAlign.justify,
      style:const TextStyle(
        fontSize: 20,
        height: 1.25
      ),
    );
  }
}