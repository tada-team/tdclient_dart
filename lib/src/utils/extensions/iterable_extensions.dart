extension IterableExtensions<T> on Iterable<T>? {
  bool get isEmptyOrNull => this == null || this!.isEmpty;
}
