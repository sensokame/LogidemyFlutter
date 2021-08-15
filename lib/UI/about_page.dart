import 'package:flutter/material.dart';
import 'package:logidemy/API/content_controller.dart';
import 'package:logidemy/UI/content_page.dart';
import 'package:logidemy/Values/constants.dart';

class AboutPage extends StatelessWidget{
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = ContentController.getContent(aboutPageContentKey);
    return ContentPage(
        title: content.title,
        pictureUrl: content.picture,
        content: content.text
    );
  }
}