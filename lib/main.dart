import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logidemy/theme/config.dart';
import 'package:logidemy/theme/custom_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UI/app_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}): super(key: key);
  //1
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  static const String themeKey = "themeValue";
  static const String languageKey = "languageValue";
  @override
  void initState() {
    super.initState();
    loadApp();
    currentTheme.addListener(() {
      //2
      setState(() {
        saveTheme();
      });
    });
    currentLanguage.addListener(() {
      setState((){
        saveLanguage();
      });
    });
  }
  void saveLanguage() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(languageKey, currentLanguage.currentLanguage.languageCode);
  }
  void saveTheme() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(themeKey, currentTheme.currentTheme.toString());
  }
  void loadApp() async{
    final prefs = await SharedPreferences.getInstance();
    var themeValue = prefs.getString(themeKey);
    ThemeMode? mode = ThemeMode.light;
    if (themeValue == ThemeMode.dark.toString()){
      mode = ThemeMode.dark;
    }
    currentTheme.toggleTheme(mode);
    var languageValue = prefs.getString(languageKey);
    currentLanguage.toggleLanguage(languageValue);

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logidemy',
      theme: CustomTheme.lightTheme, //3
      darkTheme: CustomTheme.darkTheme, //4
      themeMode: currentTheme.currentTheme, //5
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: currentLanguage.currentLanguage,
      home: const AppPage(),
    );
  }
}