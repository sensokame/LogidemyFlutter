import 'package:flutter/material.dart';


class CustomTheme with ChangeNotifier{
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
