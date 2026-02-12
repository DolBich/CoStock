part of 'prefs_bloc.dart';

@freezed
sealed class PrefsState with _$PrefsState {
  const factory PrefsState({
    required AppLocale appLocale,
    required ThemeData themeData,
  }) = _PrefsState;

  factory PrefsState.initial({
    AppLocale? locale,
    bool? useSeed,
    ThemeMode? themeMode,
    Color? colorSeed,
}) {
    ThemeHandler.init(
      useSeed: useSeed ?? false,
      mode: themeMode ?? ThemeMode.system,
      seedColor: colorSeed ?? ThemeModeConfig.defaultSeed,
    );

    return PrefsState(
      appLocale: locale ?? AppLocale.ru,
      themeData: ThemeHandler.buildTheme(),
    );
  }
}

extension PrefsStateExt on PrefsState {
  ThemeMode get themeMode => ThemeHandler.themeMode;

  ThemeModeConfig get themeConfig => AppThemeImpl.config;

  Color get seedColor => themeConfig.seed;

  bool get useSeed => themeConfig.useSeed;

  Locale get getLocale => appLocale.locale;
}
