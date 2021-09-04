import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTitle extends StatelessWidget{
  const PageTitle(this.text,
      {
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 25
        )
      )
    );
  }
}