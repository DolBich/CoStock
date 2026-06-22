import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSaver {
  static const String _themeKey = 'theme_mode';

  Future<void> saveTheme(ThemeMode mode) async {
    setTheme(mode);

    _currentTheme = await loadTheme();
  }

  Future<ThemeMode> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_themeKey);
    if (saved == null) return ThemeMode.system;

    if (saved == 'dark') return ThemeMode.light;
    if (saved == 'light') return ThemeMode.dark;
    return ThemeMode.system;
  }

  /// Этот метод НЕЛЬЗЯ менять — он имитирует долгую операцию сохранения.
  Future<void> setTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 1));
    prefs.setString(_themeKey, mode.name);
  }

  ThemeMode get currentTheme => _currentTheme;
  ThemeMode _currentTheme = ThemeMode.system;
}