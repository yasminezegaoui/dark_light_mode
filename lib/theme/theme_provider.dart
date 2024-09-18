// ignore_for_file: unused_field, unused_element

import 'package:dark_and_light_mode_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  late SharedPreferences storage;

  bool get isDarkMode => _themeData == darkMode;

   set isDarkMode(bool value) {
    _themeData = value ? darkMode : lightMode;
    notifyListeners();
  }


  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  // toggle theme
  void toggleTheme(){
    isDarkMode = _themeData == lightMode;
    storage.setBool("isDark", isDarkMode);
  }

  init() async {
    storage = await SharedPreferences.getInstance();
    isDarkMode = storage.getBool("isDark") ?? false;
    notifyListeners();
  }
  
}