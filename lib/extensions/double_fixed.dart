extension ToFixed on double {
  double toFixed(int limit) {
    double value = this;
    final List<String> splitD = value.toString().split('.');
    if (splitD.length > 1) {
      if (splitD[1].endsWith('5') && splitD[1].length >= limit) {
        value = double.parse('${value.toString()}1');
      }
    }

    return double.parse(value.toStringAsFixed(limit));
  }
}
