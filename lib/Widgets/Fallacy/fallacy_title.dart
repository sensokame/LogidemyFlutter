import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class FallacyTitle extends StatelessWidget {
  const FallacyTitle({
    Key? key,
    required this.titleText
  }) : super(key: key);
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      titleText,
      key: UniqueKey(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontSize: 35
      ),
      maxFontSize: 35,
      maxLines: 1,
    );
  }
}
