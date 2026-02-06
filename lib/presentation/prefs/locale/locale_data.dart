import 'dart:ui';

enum AppLocale {
  ru(
    LocaleData(
      code: 'ru',
      name: 'Russian',
      nativeName: 'Русский',
      countryCode: 'RU',
      isRTL: false,
    ),
  ),
  en(
    LocaleData(
      code: 'en',
      name: 'English',
      nativeName: 'English',
      countryCode: 'US',
      isRTL: false,
    ),
  );

  final LocaleData localeData;

  const AppLocale(this.localeData);

  Locale get locale => localeData.locale;

  AppLocale fromLocale(Locale locale) =>
      values.firstWhere((v) => v.locale == locale);
}

class LocaleData {
  final String code;
  final String countryCode;
  final String name;
  final String nativeName;
  final bool isRTL;

  const LocaleData({
    required this.code,
    required this.countryCode,
    required this.name,
    required this.nativeName,
    required this.isRTL,
  });

  Locale get locale => Locale(code, countryCode);
}
