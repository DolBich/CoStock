import 'dart:math';

class IdManager {
  static String get setId => '${DateTime.now().microsecondsSinceEpoch.toString()}+${Random().nextInt(1000)}';
}