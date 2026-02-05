part of '../prefs_bloc.dart';

enum ThemeSystemVariant {
  seeded(AppThemeSeeded()),
  classic(AppThemeClassic());

  final AppThemeSystem system;

  const ThemeSystemVariant(this.system);
}

class ThemeHandler {
  static ThemeSystemVariant themeSystem = ThemeSystemVariant.seeded;
  
  static ThemeData buildTheme({required ThemeMode mode}) {
    return _buildClassicTheme(mode);
  }

  static ThemeData _buildClassicTheme(ThemeMode mode) {
    return switch (mode) {
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
