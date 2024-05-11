import 'package:freezed_annotation/freezed_annotation.dart';

part 'calories.freezed.dart';
part 'calories.g.dart';

@freezed
class Calories with _$Calories {
  const factory Calories({
    required int id,
    required String name,
    @Default(0) @JsonKey(name: 'calories_Value') double caloriesValue,
  }) = _Calories;

  factory Calories.fromJson(Map<String, dynamic> json) =>
      _$CaloriesFromJson(json);
}
