import 'package:co_stock/domain/errors/validation/composite_validator.dart';
import 'package:co_stock/domain/errors/validation/validation_rules/email_rules.dart';
import 'package:co_stock/domain/errors/validation/validation_rules/login_rules.dart';
import 'package:co_stock/domain/errors/validation/validation_rules/name_rules.dart';
import 'package:co_stock/domain/errors/validation/validation_rules/password_rules.dart';
import 'package:co_stock/domain/errors/validation/validation_rules/phone_rules.dart';

class Validators {
  /// Email
  static final emailInstant = CompositeValidator([
    EmailAllowedCharsRule(),
  ]);

  static final emailFinal = CompositeValidator([
    EmailAllowedCharsRule(),
    EmailAtRule(),
    EmailDomainRule(),
  ]);

  /// Phone
  static final phoneInstant = CompositeValidator([
    PhoneOnlyDigitsRule(),
    PhoneCountryCodeRule(),
  ]);

  static final phoneFinal = CompositeValidator([
    PhoneOnlyDigitsRule(),
    PhoneCountryCodeRule(),
    PhoneFullDigitsRule(),
  ]);

  /// Login
  static final loginInstant = CompositeValidator([
    LoginAllowedCharsRule(),
  ]);

  static final loginFinal = CompositeValidator([
    LoginAllowedCharsRule(),
    LoginLengthRule(),
  ]);

  /// Password
  static final passwordInstant = CompositeValidator([
    PasswordNoWhitespaceRule(),
  ]);

  static final passwordFinal = CompositeValidator([
    PasswordNoWhitespaceRule(),
    PasswordMinLengthRule(),
    PasswordUppercaseRule(),
    PasswordLowercaseRule(),
    PasswordDigitRule(),
    PasswordSpecialCharRule(),
  ]);

  /// Name
  static final nameInstant = CompositeValidator([
    NameAllowedCharsRule(),
  ]);

  static final nameFinal = CompositeValidator([
    NameAllowedCharsRule(),
    NameMinLengthRule(),
    NameMaxLengthRule(),
  ]);
}