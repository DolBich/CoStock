import 'package:co_stock/domain/bases/cancel_token.dart';

abstract class IRepository {}

mixin MockRepoDelay {
  static const int millisecondsDelay = 600;
  static const int stepMillis = 101;

  static const Duration delayDuration = Duration(milliseconds: millisecondsDelay);

  Future<void> delay() => Future.delayed(delayDuration);

  /// Нужен для симуляции интернет запроса с отменой до прихода ответа
  /// [true] - was canceled
  Future<bool> cancelableDelay(CancelToken? cancelToken) async {
    const int steps = millisecondsDelay ~/ stepMillis;
    for (int i = 0; i < steps; i++) {
      await Future.delayed(const Duration(milliseconds: stepMillis));
      if (cancelToken?.isCancelled ?? false) {
        return true;
      }
    }
    // Остаток от деления
    const int remainder = millisecondsDelay % stepMillis;
    if (remainder > 0) {
      await Future.delayed(const Duration(milliseconds: remainder));
      if (cancelToken?.isCancelled ?? false) {
        return true;
      }
    }
    return false;
  }
}