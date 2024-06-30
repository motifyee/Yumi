import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/domain/meal/entity/ingredients.dart';

part 'meal.g.dart';
part 'meal.freezed.dart';

enum MenuTarget { order, preOrder }

@freezed
class Meal with _$Meal {
  const factory Meal({
    int? id,
    int? productVariantID,
    String? chefId,
    String? code,
    String? name,
    String? photo,
    double? price1,
    @JsonKey(name: 'calories_Value') double? caloriesValue,
    @JsonKey(name: 'preparation_time') double? preparationTime,
    @JsonKey(name: 'portion_Persons') double? portionPersons,
    @JsonKey(name: 'is_Order') bool? isOrder,
    @JsonKey(name: 'is_Pre_Order') bool? isPreOrder,
    @JsonKey(name: 'pickup_Only') bool? isPickUpOnly,
    List<int>? categoriesIds,
    List<Ingredients>? ingredients,
    @JsonKey(name: 'isFavoritProduct') @Default(false) bool? isFavoriteProduct,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}