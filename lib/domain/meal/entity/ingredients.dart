import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredients.g.dart';
part 'ingredients.freezed.dart';

@freezed
class Ingredients with _$Ingredients {
  const factory Ingredients({
    String? id,
    String? code,
    String? name,
    @JsonKey(name: 'portion_Grams') double? portionGrams,
  }) = _Ingredients;

  factory Ingredients.fromJson(Map<String, dynamic> json) => _$IngredientsFromJson(json);
}
