import 'package:flutter/material.dart';
import 'package:habbittracker/pages/dark_mode.dart';
import 'package:habbittracker/pages/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightmode;

// get
  ThemeData get themedata => _themeData;

//
  bool get isDarkMode => _themeData == darkmode;
  // set
  set themedata(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themedata = darkmode;
    } else {
      themedata = lightmode;
    }
  }
}
