part of 'prefs_bloc.dart';

@freezed
sealed class PrefsState with _$PrefsState {
  const factory PrefsState({
    /// Опеределяет страну, язык которой используется
    /// Под неё подстраивается реклама и требования этой страны
    /// мы должны соблюдать в приложении (на будущее)
    required AppLocale appLocale,

    /// Номер телефона какой страны использует
    /// По умолчанию равен [appLocale]
    required AppLocale phoneLocale,

    required ThemeData themeData,
    required bool useMock,
  }) = _PrefsState;

  factory PrefsState.initial({
    AppLocale? appLocale,
    AppLocale? phoneLocale,
    bool? useSeed,
    ThemeMode? themeMode,
    Color? colorSeed,
    bool? useMock,
}) {
    ThemeHandler.init(
      useSeed: useSeed ?? false,
      mode: themeMode ?? .light,
      seedColor: colorSeed ?? ThemeConfig.defaultSeed,
    );

    return PrefsState(
      appLocale: appLocale ?? .ru,
      phoneLocale: phoneLocale ?? appLocale ?? .ru,
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
