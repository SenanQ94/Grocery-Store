import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  bool _darkTheme = false;
  final String key = "theme";
  SharedPreferences? _prefs;
  bool get darkTheme => _darkTheme;

  DarkThemeProvider() {
    _darkTheme = false;
    _loadFromPrefs();
  }

  //change Theme
  toggleTheme(bool val) {
    _darkTheme = val;
    _saveToPrefs();
    notifyListeners();
  }

  // Initializing SharedPreferences for the first time
  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // get the values saved in SharedPreferences
  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs!.getBool(key) ?? true;
    notifyListeners();
  }

  // save the values in SharedPreferences
  _saveToPrefs() async {
    await _initPrefs();
    _prefs!.setBool(key, _darkTheme);
  }
}
