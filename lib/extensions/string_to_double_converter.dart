import 'package:freezed_annotation/freezed_annotation.dart';

class StringToDoubleAsIntStringConverter
    extends JsonConverter<String?, double?> {
  const StringToDoubleAsIntStringConverter();
  @override
  String? fromJson(double? json) {
    return json?.round().toString();
  }

  @override
  double? toJson(String? object) {
    return object == null ? null : double.parse(object);
  }
}
