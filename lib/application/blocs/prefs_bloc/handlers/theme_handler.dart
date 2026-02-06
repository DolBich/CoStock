part of '../prefs_bloc.dart';

/// Этот класс управляет темами.
/// Систему тем можно сменить через [themeSystem]
class ThemeHandler {
  static void init({
    required ThemeSystemVariant themeSysVar,
    required ThemeMode mode,
    required Color seedColor,
  }) {
    themeSystem = themeSysVar;
    themeMode = mode;
    AppThemeSeeded.seed = seedColor;
  }

  static ThemeSystemVariant themeSystem = ThemeSystemVariant.seeded;
  static ThemeMode themeMode = ThemeMode.system;

  static ThemeData buildTheme() {
    return switch (themeMode) {
      ThemeMode.light => themeSystem.system.lightTheme,
      ThemeMode.dark => themeSystem.system.darkTheme,
      ThemeMode.system => _getSystemTheme(),
    };
  }

  static ThemeData _getSystemTheme() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    return brightness == Brightness.dark
        ? themeSystem.system.lightTheme
        : themeSystem.system.darkTheme;
  }
}
