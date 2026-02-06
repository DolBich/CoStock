part of 'prefs_bloc.dart';

@freezed
sealed class PrefsEvent with _$PrefsEvent {
  const factory PrefsEvent.init() = _Init;


  /// Theme
  const factory PrefsEvent.setThemeMode(ThemeMode mode) = _SetThemeMode;

  const factory PrefsEvent.setSeedColor(Color seed) = _SetSeedColor;

  const factory PrefsEvent.changeThemeSystem(ThemeSystemVariant themeSystem) = _ChangeThemeSystem;

  /// Localization
  const factory PrefsEvent.changeLocale(AppLocale appLocale) = _ChangeLocale;
}
