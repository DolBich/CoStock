part of 'prefs_bloc.dart';

@freezed
sealed class PrefsState with _$PrefsState {
  const factory PrefsState({
    required ThemeMode themeMode,
    required Color seedColor,
    required ThemeData themeData,
  }) = _PrefsState;

  factory PrefsState.initial() {
    return PrefsState(
      themeMode: ThemeMode.system,
      seedColor: AppThemeSeeded.defaultSeed,
      themeData: ThemeHandler.buildTheme(
        mode: ThemeMode.system,
      ),
    );
  }
}
