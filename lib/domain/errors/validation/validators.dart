import 'package:co_stock/domain/errors/validation/field_validator.dart';
import 'package:co_stock/domain/errors/validation/validation_rules/email_rules.dart';
import 'package:co_stock/domain/errors/validation/validation_rules/login_rules.dart';
import 'package:co_stock/domain/errors/validation/validation_rules/name_rules.dart';
import 'package:co_stock/domain/errors/validation/validation_rules/password_rules.dart';
import 'package:co_stock/domain/errors/validation/validation_rules/phone_rules.dart';
import 'package:co_stock/presentation/prefs/locale/locale_data.dart';

class Validators {
  static const FieldValidator email = FieldValidator(
    requirements: [
      EmailAllowedCharsRule(),
      // EmailAtRule(),
      EmailDomainRule(),
    ],
  );

  static FieldValidator phoneWithLocale(LocaleData locale) {
    final codeDigits = locale.phonePrefix.replaceAll(RegExp(r'\D'), '');
    final totalDigits = codeDigits.length + locale.phoneNationalLength;
    return FieldValidator(
      requirements: [
        const PhoneOnlyDigitsRule(),
        // PhoneCountryCodeRule(expectedPrefix: locale.phonePrefix),
        PhoneFullDigitsRule(totalDigits: totalDigits),
      ],
    );
  }

  static const FieldValidator login = FieldValidator(
    requirements: [LoginAllowedCharsRule(), LoginLengthRule()],
  );

  static const FieldValidator password = FieldValidator(
    requirements: [PasswordNoWhitespaceRule(), PasswordMinLengthRule()],
    suggestions: [
      PasswordUppercaseRule(),
      PasswordLowercaseRule(),
      PasswordDigitRule(),
      PasswordSpecialCharRule(),
    ],
    suggestionsText: 'Для улучшения пароля:',
  );

  static const FieldValidator name = FieldValidator(
    requirements: [
      NameAllowedCharsRule(),
      NameMinLengthRule(),
      NameMaxLengthRule(),
    ],
  );
}
