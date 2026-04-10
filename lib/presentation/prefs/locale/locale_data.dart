import 'dart:ui';

import 'package:country_flags/country_flags.dart';

enum AppLocale {
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

  static List<Locale> get supportedLocales => values.map((e) => e.locale).toList();
  static List<LocaleData> get supportedLocalesData => values.map((e) => e.localeData).toList();

  static Locale get fallbackLocale => ru.locale;

  Locale get locale => localeData.locale;

  static AppLocale? byName(String name) => values.firstWhere((v) => v.name == name);

  static AppLocale fromLocale(Locale locale) =>
      values.firstWhere((v) => v.locale == locale);
}

class LocaleData {
  final String code;
  final String countryCode;
  final String name;
  final String nativeName;
  final bool isRTL;
  final String phonePrefix;
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

  Locale get locale => Locale(code, countryCode);

  CountryFlag get flagEmoji => CountryFlag.fromCountryCode(countryCode);
}
