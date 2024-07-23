import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  var _themeMode = ThemeMode.dark; //default to light

  //theme getter
  ThemeMode get getThemeMode => _themeMode;

  //theme setter
  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
