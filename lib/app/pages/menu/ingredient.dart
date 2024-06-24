import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
abstract class Ingredient with _$Ingredient {
  const factory Ingredient({
    String? id,
    String? code,
    String? name,
    double? portionGrams,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
