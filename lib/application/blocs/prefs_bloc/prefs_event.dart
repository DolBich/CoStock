part of 'prefs_bloc.dart';

@freezed
sealed class PrefsEvent with _$PrefsEvent {

  /// Инициализация
  const factory PrefsEvent.init() = _Init;

  ///
  /// Тема
  ///

  /// Установка яркост темы (светлая/тёмная/системная)
  const factory PrefsEvent.setThemeMode(ThemeMode mode) = _SetThemeMode;

  /// Установка цвета сида для темы на основе сида
  const factory PrefsEvent.setSeedColor(Color seed) = _SetSeedColor;

  /// Использовать тему на основе сида, или нет
  const factory PrefsEvent.changeUseSeed(bool useSeed) = _ChangeUseSeed;

  ///
  /// Локализация
  ///

  /// Смена локали приложения
  const factory PrefsEvent.changeAppLocale(AppLocale appLocale) =
      _ChangeAppLocale;

  /// Смена локали номера телефона (для номера страны +7, +344 и тд.)
  const factory PrefsEvent.changePhoneLocale(AppLocale phoneLocale) =
      _ChangePhoneLocale;

  ///
  /// Репозитории
  ///

  /// Переключение действующего типа репозитории (mock/firebase)
  const factory PrefsEvent.changeRepo() = _ChangeRepo;
}
