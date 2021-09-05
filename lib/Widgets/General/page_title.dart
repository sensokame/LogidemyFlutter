import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PageTitle extends StatelessWidget{
  const PageTitle(this.text,
      {
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
        text,
      maxLines: 1,
      maxFontSize: 35,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35
        )
      )
    );
  }
}