import 'package:flutter/material.dart';

class CustomLanguage with ChangeNotifier {
  Locale currentLanguage = const Locale('en');
  void toggleLanguage(String? language) {
    currentLanguage = Locale(language ?? 'en');
    notifyListeners();
  }
  String getLanguageText(String code){
    switch(code){
      case "en":
        return "English";
      case "ar":
        return "العربية";
      default:
        throw Exception("Language not supported.");
    }
  }
}
