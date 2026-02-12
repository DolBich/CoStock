part of '../prefs_bloc.dart';

/// Этот класс управляет темами.
class ThemeHandler {
  static void init({
    required bool useSeed,
    required ThemeMode mode,
    required Color seedColor,
  }) {
    themeMode = mode;
    changeThemeConfig(seed: seedColor, useSeed: useSeed);
  }

  static void changeThemeConfig({bool? useSeed, Color? seed}) =>
      AppThemeImpl.config = AppThemeImpl.config.copyWith(
        seed: seed,
        useSeed: useSeed,
      );
  static ThemeMode themeMode = ThemeMode.system;

  static ThemeData buildTheme() {
    return switch (themeMode) {
      ThemeMode.light => AppThemeImpl().lightTheme,
      ThemeMode.dark => AppThemeImpl().darkTheme,
      ThemeMode.system => _getSystemTheme(),
    };
  }

  static ThemeData _getSystemTheme() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    return brightness == Brightness.dark
        ? AppThemeImpl().lightTheme
        : AppThemeImpl().darkTheme;
  }
}
