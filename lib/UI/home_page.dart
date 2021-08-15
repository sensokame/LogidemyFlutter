import 'package:flutter/material.dart';
import 'package:logidemy/API/content_controller.dart';
import 'package:logidemy/Values/constants.dart';

import 'content_page.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // for a first version, home page will be a content page showing how to use the app
    var content = ContentController.getContent(homePageContentKey);
    return ContentPage(
      title:  content.title,
      content: content.text,
      pictureUrl: content.picture,
    );
  }

}