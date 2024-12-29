import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeProvider extends ChangeNotifier {
  static const _themeBoxKey = 'themeBox';
  static const _themeModeKey = 'themeMode';
  ThemeMode _themeMode = ThemeMode.light;

  ThemeProvider() {
    _loadThemeFromStorage();
  }

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _saveThemeToStorage();
    notifyListeners();
  }

  void _loadThemeFromStorage() {
    final box = Hive.box(_themeBoxKey);
    final savedTheme = box.get(_themeModeKey, defaultValue: 'light');
    _themeMode = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  void _saveThemeToStorage() {
    final box = Hive.box(_themeBoxKey);
    box.put(_themeModeKey, _themeMode.name);
  }
}
