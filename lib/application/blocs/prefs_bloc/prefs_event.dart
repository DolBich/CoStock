part of 'prefs_bloc.dart';

@freezed
sealed class PrefsEvent with _$PrefsEvent {
  const factory PrefsEvent.init() = _Init;

  /// Theme
  const factory PrefsEvent.setThemeMode(ThemeMode mode) = _SetThemeMode;

  const factory PrefsEvent.setSeedColor(Color seed) = _SetSeedColor;

  const factory PrefsEvent.changeUseSeed(bool useSeed) = _ChangeUseSeed;

  /// Localization
  const factory PrefsEvent.changeAppLocale(AppLocale appLocale) =
      _ChangeAppLocale;

  const factory PrefsEvent.changePhoneLocale(AppLocale phoneLocale) =
      _ChangePhoneLocale;

  /// Repositories
  const factory PrefsEvent.changeRepo() = _ChangeRepo;
}
