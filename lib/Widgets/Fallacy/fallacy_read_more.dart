import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class FallacyReadMore extends StatelessWidget{
  const FallacyReadMore({Key? key,
    required this.readMore
  }) : super(key: key);
  final String readMore;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
          AppLocalizations.of(context)!.readMoreText,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 15
        ),
      ),
      onTap: ()=> launch(readMore)
    );
  }

}