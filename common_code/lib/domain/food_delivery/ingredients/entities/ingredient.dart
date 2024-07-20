import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.g.dart';
part 'ingredient.freezed.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    String? id,
    String? code,
    String? name,
    @JsonKey(name: 'portion_Grams') double? portionGrams,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
