import 'package:flutter/material.dart';
import 'package:logidemy/UI/content_page.dart';
import 'package:logidemy/Values/constants.dart';

class AboutPage extends StatelessWidget{
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ContentPage(
        contentKey: aboutPageContentKey,
    );
  }
}