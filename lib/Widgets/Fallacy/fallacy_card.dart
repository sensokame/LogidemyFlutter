import 'package:flutter/material.dart';
import 'package:logidemy/Model/fallacy.dart';
import 'package:logidemy/Widgets/Fallacy/fallacy_example.dart';
import 'package:logidemy/Widgets/Fallacy/fallacy_read_more.dart';
import 'package:logidemy/Widgets/General/rounded_picture_widget.dart';

import 'fallacy_description.dart';
import 'fallacy_title.dart';

class FallacyCard extends StatelessWidget {
  const FallacyCard({Key? key, required this.fallacy}) : super(key: key);
  final Fallacy? fallacy;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // keep 2.5% padding before and after title
    var padTitle = size.height*2.5/100;
    var padText = size.height *2/100;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Picture
        RoundedPictureWidget(picture: fallacy!.picture),
        // padding before title
        Padding(
          padding: EdgeInsets.fromLTRB(0, padTitle, 0, 0),
        ),
        // Title
        FallacyTitle(titleText: fallacy!.name),
        Padding(
          padding: EdgeInsets.fromLTRB(0, padTitle, 0, 0),
        ),
        // description
        FallacyDescription(descriptionText: fallacy!.description),
        Padding(
          padding: EdgeInsets.fromLTRB(0, padText, 0, 0),
        ),
        // example
        FallacyExample(exampleText: fallacy!.example),
        Padding(
          padding: EdgeInsets.fromLTRB(0, padText, 0, padText),
        ),
        FallacyReadMore(readMore: fallacy!.readMore)
      ],
    ));
  }
}
