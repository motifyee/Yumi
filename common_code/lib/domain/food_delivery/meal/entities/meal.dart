import 'package:dependencies/dependencies.dart';
import 'package:common_code/domain/food_delivery/ingredients/entities/ingredient.dart';

part 'meal.g.dart';
part 'meal.freezed.dart';

enum OrderType { order, preOrder }

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
    List<Ingredient>? ingredients,
    @JsonKey(name: 'isFavoritProduct') @Default(false) bool? isFavoriteProduct,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
