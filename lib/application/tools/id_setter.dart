import 'dart:math';

/// Устанавливает уникальный id
class IdSetter {
  const IdSetter();

  /// Можно использовать этот метод через вызов [IdSetter()()]
  String call() => '${DateTime.now().microsecondsSinceEpoch.toString()}+${Random().nextInt(1000)}';
}