import 'package:dependencies/dependencies.dart';

part 'calorie.freezed.dart';
part 'calorie.g.dart';

@freezed
class Calorie with _$Calorie {
  const factory Calorie({
    required int id,
    required String name,
    @Default(0) @JsonKey(name: 'calories_Value') double caloriesValue,
  }) = _Calorie;

  factory Calorie.fromJson(Map<String, dynamic> json) =>
      _$CalorieFromJson(json);
}
