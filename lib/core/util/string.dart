extension StringX on String {
  String onEmpty(String value) {
    return isEmpty ? value : this;
  }
}
