import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logidemy/API/fallacies_controller.dart';
import 'package:logidemy/Model/fallacy_category.dart';
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
  static const String ThemeKey = "themeValue";
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
  }
  void saveTheme() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(ThemeKey, currentTheme.currentTheme.toString());
  }
  void loadApp() async{
    final prefs = await SharedPreferences.getInstance();
    var themeValue = prefs.getString(ThemeKey);
    ThemeMode? mode = ThemeMode.light;
    if (themeValue == ThemeMode.dark.toString()){
      mode = ThemeMode.dark;
    }
    setState((){
      currentTheme.currentTheme = mode;
    });

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
      home: AppPage(fallacies: getFallacies()),
    );
  }

  List<FallacyCategory> getFallacies() {
    // TODO make api call to the list of fallacies
    return FallaciesControllers.getAllCategories();
  }
}