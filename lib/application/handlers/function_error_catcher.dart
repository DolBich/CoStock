extension FunctionErrorCatcher<T> on T Function() {
  /// Выполняет функцию, перехватывает ошибки и вызывает [onCatch].
  /// При ошибке возвращает null.
  T? catchError(void Function(Object error, StackTrace stackTrace) onCatch) {
    try {
      return this();
    } catch (e, st) {
      onCatch(e, st);
      return null;
    }
  }
}

extension VoidFunctionErrorCatcher on void Function() {
  /// То же для void-функций.
  void catchError(void Function(Object error, StackTrace stackTrace) onCatch) {
    try {
      this();
    } catch (e, st) {
      onCatch(e, st);
    }
  }
}

