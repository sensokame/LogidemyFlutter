import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logidemy/Widgets/General/page_title.dart';
import 'package:logidemy/Widgets/Settings/language_item.dart';
import 'package:logidemy/theme/config.dart';

class LanguagePage extends StatefulWidget{
  const LanguagePage({Key? key}) : super(key: key);
  @override
  _LanguagePageState createState()  => _LanguagePageState();
}
class _LanguagePageState extends State<LanguagePage>{
  var selectedLanguage = currentLanguage.currentLanguage.languageCode;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = size.height * 2.5 / 100;
    return Column(
      children: [
        // title
        PageTitle(AppLocalizations.of(context)!.selectLanguageText),
        Padding(
          padding: EdgeInsets.fromLTRB(0,padding,0,padding),
        ),
        ...getSupportedLanguages()
      ],
    );
  }
  Iterable<Widget> getSupportedLanguages() {
    var res = <Widget>[];
    for(var l in AppLocalizations.supportedLocales){
      res.add(
          LanguageItem(
              language : currentLanguage.getLanguageText(l.languageCode),
              onTap : () {
                setLanguage(l.languageCode);
              },
              selected: selectedLanguage == l.languageCode
          )
      );
      res.add(
        Divider(
          color: Theme.of(context).colorScheme.onSurface,
        )
      );
    }
    return res;
  }
  setLanguage(String language){
    currentLanguage.toggleLanguage(language);
    setState((){
      selectedLanguage = language;
    });
  }
}