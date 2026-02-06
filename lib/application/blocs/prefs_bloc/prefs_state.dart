part of 'prefs_bloc.dart';

@freezed
sealed class PrefsState with _$PrefsState {
  const factory PrefsState({
    required AppLocale appLocale,
    required ThemeData themeData,
  }) = _PrefsState;

  factory PrefsState.initial({
    AppLocale? locale,
    ThemeSystemVariant? themeSysVar,
    ThemeMode? themeMode,
    Color? colorSeed,
}) {
    ThemeHandler.init(
      themeSysVar: themeSysVar ?? ThemeSystemVariant.seeded,
      mode: themeMode ?? ThemeMode.system,
      seedColor: colorSeed ?? AppThemeSeeded.defaultSeed,
    );

    return PrefsState(
      appLocale: locale ?? AppLocale.ru,
      themeData: ThemeHandler.buildTheme(),
    );
  }
}

extension PrefsStateExt on PrefsState {
  ThemeMode get themeMode => ThemeHandler.themeMode;

  Color get seedColor => AppThemeSeeded.seed;

  ThemeSystemVariant get themeSysVar => ThemeHandler.themeSystem;

  Locale get getLocale => appLocale.locale;
}
