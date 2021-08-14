import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logidemy/Widgets/Settings/language_item.dart';
import 'package:logidemy/theme/config.dart';

class LanguagePage extends StatefulWidget{
  const LanguagePage({Key? key}) : super(key: key);
  @override
  _LanguagePageState createState()  => _LanguagePageState();
}
class _LanguagePageState extends State<LanguagePage>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title
        Text(AppLocalizations.of(context)!.selectLanguageText),
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
              onTap : () => setLanguage(l.languageCode)
          )
      );
    }
    return res;
  }
  setLanguage(String language){
    currentLanguage.toggleLanguage(language);
  }
}