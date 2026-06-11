import 'dart:ui';

import 'package:country_flags/country_flags.dart';

/// Набор поддерживаемых локалей в приложении
enum AppLocale {
  /// Русский
  ru(
    LocaleData(
      code: 'ru',
      countryCode: 'RU',
      name: 'Russian',
      nativeName: 'Русский',
      isRTL: false,
      phonePrefix: '+7',
      phoneNationalLength: 10,
    ),
  ),

  /// Английский
  en(
    LocaleData(
      code: 'en',
      countryCode: 'US',
      name: 'English',
      nativeName: 'English',
      isRTL: false,
      phonePrefix: '+1',
      phoneNationalLength: 10,
    ),
  );

  const AppLocale(this.localeData);
  final LocaleData localeData;

  /// Единный список поддерживаемых локалей
  static List<Locale> get supportedLocales => values.map((e) => e.locale).toList();

  /// Список данных поддерживаемых локалей
  static List<LocaleData> get supportedLocalesData => values.map((e) => e.localeData).toList();

  /// Локаль для отката приложения, если что-то пойдёт не так (стандартный язык)
  static Locale get fallbackLocale => ru.locale;

  Locale get locale => localeData.locale;

  static AppLocale? byName(String name) => values.firstWhere((v) => v.name == name);

  static AppLocale fromLocale(Locale locale) =>
      values.firstWhere((v) => v.locale == locale);
}

/// Сборка данных об языке вместе со всеми сопутствующими данными для отрисовки
class LocaleData {
  /// Код языка ('en', 'ru')
  final String code;

  /// Код страны ('US', 'RU')
  final String countryCode;

  /// Название языка на английском
  final String name;

  /// Название языка на нативном
  final String nativeName;

  /// ПИшется справо налево или наоборот
  final bool isRTL;

  /// С каких цифр начинается номер телефона в этой стране (+7, +344)
  final String phonePrefix;

  /// Какого размера номер телефона в этой стране
  final int phoneNationalLength;

  const LocaleData({
    required this.code,
    required this.countryCode,
    required this.name,
    required this.nativeName,
    required this.isRTL,
    required this.phonePrefix,
    required this.phoneNationalLength,
  });

  /// Получение локали
  Locale get locale => Locale(code, countryCode);

  /// Получение флага страны
  CountryFlag get flagEmoji => CountryFlag.fromCountryCode(countryCode);
}
/// Код страны (+7, +344)
