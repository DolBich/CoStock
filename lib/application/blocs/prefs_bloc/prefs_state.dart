part of 'prefs_bloc.dart';

@freezed
sealed class PrefsState with _$PrefsState {
  const factory PrefsState({
    required ThemeMode themeMode,
    required Color seedColor,
    required ThemeData themeData,
    required AppLocale appLocale,
  }) = _PrefsState;

  /// TODO: притягивать все эти значения из настроек в pref_ref
  factory PrefsState.initial() {
    return PrefsState(
      themeMode: ThemeMode.system,
      seedColor: AppThemeSeeded.defaultSeed,
      themeData: ThemeHandler.buildTheme(
        mode: ThemeMode.system,
      ),
      appLocale: AppLocale.ru
    );
  }
}
