part of '../prefs_bloc.dart';

/// Управляет темой приложения: светлая/тёмная/системная, цветовой акцент (seed),
/// а также опция использования seed-цвета.
/// Вся логика статическая, чтобы можно было получать текущую тему в любой точке
/// приложения без привязки к Bloc (например, в диалогах, уведомлениях).
///
/// Новая тема собирается через `buildTheme()` и сохраняется в состояние PrefsBloc.
class ThemeHandler {
  /// Инициализирует менеджер тем при старте приложения.
  static void init({
    required bool useSeed,
    required ThemeMode mode,
    required Color seedColor,
  }) {
    themeMode = mode;
    changeThemeConfig(seed: seedColor, useSeed: useSeed);
  }


  /// Обновляет конфигурацию темы.
  /// Записывает изменения в глобальный конфиг [AppThemeImpl.config]
  static void changeThemeConfig({bool? useSeed, Color? seed}) =>
      AppThemeImpl.config = AppThemeImpl.config.copyWith(
        seed: seed,
        useSeed: useSeed,
      );

  /// Какая тема сейчас используется
  static ThemeMode themeMode = ThemeMode.light;

  /// Построение темы по нынешним глобальным настройкам [AppThemeImpl.config]
  /// Тема берётся из глобального [AppThemeImpl()]
  static ThemeData buildTheme() {
    return switch (themeMode) {
      .light => AppThemeImpl().lightTheme,
      .dark => AppThemeImpl().darkTheme,
      .system => _getSystemTheme(),
    };
  }

  /// Получение темы из глобального конфига в соответствии с системной темой
  static ThemeData _getSystemTheme() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    return brightness == Brightness.dark
        ? AppThemeImpl().lightTheme
        : AppThemeImpl().darkTheme;
  }
}
