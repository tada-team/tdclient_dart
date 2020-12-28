extension StringExtensions on String {
  bool get isEmptyOrNull => this == null || isEmpty;
}
