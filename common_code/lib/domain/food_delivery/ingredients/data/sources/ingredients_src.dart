import 'package:common_code/domain/food_delivery/ingredients/entities/ingredient.dart';

abstract class IngredientsSrc {
  Future<List<Ingredient>> getIngredients();
}
