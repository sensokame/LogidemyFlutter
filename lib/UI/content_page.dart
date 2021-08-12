import 'package:flutter/material.dart';
import 'package:logidemy/Widgets/General/rouded_picture_widget.dart';

class ContentPage extends StatelessWidget{
  const ContentPage({
    Key? key,
    required this.title,
    required this.pictureUrl,
    required this.content
  }) : super(key: key);
  final String title;
  final String pictureUrl;
  final String content;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        // Title
        Text(title),
        // App logo
        RoundedPictureWidget(picture: pictureUrl),
        // Text about page
        Text(content)
      ],
    );
  }

}