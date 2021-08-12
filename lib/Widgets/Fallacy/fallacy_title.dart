import 'package:flutter/material.dart';

class FallacyTitle extends StatelessWidget {
  const FallacyTitle({
    Key? key,
    required this.titleText
  }) : super(key: key);
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      key: UniqueKey(),
      textAlign: TextAlign.center
    );
  }
}
