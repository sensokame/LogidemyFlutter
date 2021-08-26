import 'package:flutter/material.dart';
import 'package:logidemy/Values/constants.dart';

import 'content_page.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const ContentPage(
      contentKey: homePageContentKey,
    );
  }

}