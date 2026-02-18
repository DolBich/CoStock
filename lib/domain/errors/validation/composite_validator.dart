import 'package:co_stock/domain/errors/validation/validation_rule.dart';

class CompositeValidator implements ValidationRule {
  final List<ValidationRule> rules;

  CompositeValidator(this.rules);

  @override
  String? validate(String input) {
    for (final rule in rules) {
      final error = rule.validate(input);
      if (error != null) return error;
    }
    return null;
  }
}