import 'package:flutter/material.dart';


class CustomTheme with ChangeNotifier{
  static final CustomTheme _customTheme = CustomTheme._internal();
  factory CustomTheme(){
    return _customTheme;
  }
  CustomTheme._internal();
  ThemeMode? currentTheme = ThemeMode.light;

  void toggleTheme(ThemeMode? mode) {
    currentTheme = mode;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    // for now keep the default themes
    return ThemeData.light();
  }

  static ThemeData get darkTheme {
    // for now keep the default themes
    return ThemeData.dark();
  }
}
