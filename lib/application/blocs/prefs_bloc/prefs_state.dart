part of 'prefs_bloc.dart';

@freezed
sealed class PrefsState with _$PrefsState {
  const factory PrefsState({
    required AppLocale appLocale,
    required ThemeData themeData,
    required bool useMock,
  }) = _PrefsState;

  factory PrefsState.initial({
    AppLocale? locale,
    bool? useSeed,
    ThemeMode? themeMode,
    Color? colorSeed,
    bool? useMock,
}) {
    ThemeHandler.init(
      useSeed: useSeed ?? false,
      mode: themeMode ?? ThemeMode.light,
      seedColor: colorSeed ?? ThemeConfig.defaultSeed,
    );

    return PrefsState(
      appLocale: locale ?? AppLocale.ru,
      themeData: ThemeHandler.buildTheme(),
      useMock: useMock ?? true,
    );
  }
}

extension PrefsStateExt on PrefsState {
  ThemeMode get themeMode => ThemeHandler.themeMode;

  ThemeConfig get themeConfig => AppThemeImpl.config;

  Color get seedColor => themeConfig.seed;

  bool get useSeed => themeConfig.useSeed;

  Locale get getLocale => appLocale.locale;
}
