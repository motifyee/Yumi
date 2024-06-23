import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class Country {
  final int? id;
  final String? name;

  const Country({this.id, this.name});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

class CountryConverter implements JsonConverter<Country, dynamic> {
  const CountryConverter();

  @override
  Country fromJson(dynamic json) => Country(id: json.id, name: json.name);

  @override
  int toJson(Country obj) => obj.id ?? 0;
}
