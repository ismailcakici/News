import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  Icon _icon = const Icon(Icons.dark_mode);
  get themeMode => _themeMode;
  get iconMode => _icon;
  changeTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  checkIcon() {
    _icon = _themeMode == ThemeMode.light
        ? const Icon(Icons.dark_mode)
        : const Icon(Icons.light_mode);
    notifyListeners();
  }
}
