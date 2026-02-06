extension IterableExt<T> on Iterable<T> {
  T firstWhereOrNull(bool Function(T) test) {
      return firstWhere(test, orElse: null);
  }
}