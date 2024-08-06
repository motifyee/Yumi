import 'package:dependencies/dependencies.dart';

class DateTimeToIso8601StringConverter extends JsonConverter<DateTime, String> {
  const DateTimeToIso8601StringConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime object) {
    return object.toIso8601String();
  }
}
