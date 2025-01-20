// ignore_for_file: avoid_print
import 'package:ntp/ntp.dart';

void main() {
  // stringToDate();
  time();
}

time() async {
  final time = await NTP.now();
  time.toUtc();
  print(time.toUtc());
}

stringToDate() {
  final x = DateTime.tryParse('');
  print(x);

  final a = DateTime.parse('1974-03-20T00:00:00.000');
  final b = DateTime.parse('1975-03-20T00:00:00.000');

  print(a.difference(b));
  print(b.difference(a));
}
