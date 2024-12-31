void main() {
  stringToDate();
}

stringToDate() {
  final x = DateTime.tryParse('');
  print(x);

  final a = DateTime.parse('1974-03-20T00:00:00.000');
  final b = DateTime.parse('1975-03-20T00:00:00.000');

  print(a.difference(b));
  print(b.difference(a));
}
