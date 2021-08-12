import 'package:flutter/material.dart';
import 'package:logidemy/API/content_controller.dart';
import 'package:logidemy/UI/content_page.dart';

class AboutPage extends StatelessWidget{
  const AboutPage({Key? key}) : super(key: key);
  final String aboutKey = "about";

  @override
  Widget build(BuildContext context) {
    var content = ContentController.getContent(aboutKey);
    return ContentPage(
        title: content.title,
        pictureUrl: content.picture,
        content: content.text
    );
  }
}