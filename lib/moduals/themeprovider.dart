import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class themeprovider with ChangeNotifier {
  var tm = ThemeMode.system;
  String themeText = "s";

  void themeModeChange(newThemeVal) async {
    tm = newThemeVal;
    _getThemeText(tm);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("themeText", themeText);
  }

  void _getThemeText(ThemeMode tm) {
    if (tm == ThemeMode.dark) {
      themeText = "d";
    } else if (tm == ThemeMode.light) {
      themeText = "l";
    } else if (tm == ThemeMode.system) {
      themeText = "s";
    }
  }

  void getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    themeText = prefs.getString("themeText") ?? "s";
    if (themeText == "d") {
      tm = ThemeMode.dark;
     
    } else if (themeText == "l") {
      tm = ThemeMode.light;
     
    } else if (themeText == "s") {
      tm = ThemeMode.system;
     
    }
    notifyListeners();
  }

  /*
   ThemeMode getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    themeText = prefs.getString("themeText") ?? "s";
    if (themeText == "d") {
      tm = ThemeMode.dark;
      return tm;
    } else if (themeText == "l") {
      tm = ThemeMode.light;
      print(tm);
      return tm;
    } else if (themeText == "s") {
      tm = ThemeMode.system;
      return tm;
      print(tm);
    }
    
    notifyListeners();
    return tm;
}*/
}
