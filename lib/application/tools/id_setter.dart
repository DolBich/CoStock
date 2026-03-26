import 'dart:math';

class IdSetter {
  static String get setId => '${DateTime.now().microsecondsSinceEpoch.toString()}+${Random().nextInt(1000)}';
}