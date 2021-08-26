import 'package:flutter/material.dart';
import 'package:logidemy/Model/fallacy.dart';
import 'package:logidemy/Widgets/Fallacy/fallacy_example.dart';
import 'package:logidemy/Widgets/General/rounded_picture_widget.dart';

import 'fallacy_description.dart';
import 'fallacy_title.dart';

class FallacyCard extends StatelessWidget {
  const FallacyCard({Key? key, required this.fallacy}) : super(key: key);
  final Fallacy? fallacy;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    Container(
      child: Card(
          child: IntrinsicHeight(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Picture
              RoundedPictureWidget(picture: fallacy!.picture),
              // Title
              FallacyTitle(titleText: fallacy!.name),
              // description
              FallacyDescription(descriptionText: fallacy!.description),
              // example
              FallacyExample(exampleText: fallacy!.example)
            ],
          ),
        ),
      )
    );
  }
}
