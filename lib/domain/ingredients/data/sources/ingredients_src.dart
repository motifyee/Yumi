import 'package:yumi/domain/ingredients/entities/ingredient.dart';

abstract class IngredientsSrc {
  Future<List<Ingredient>> getIngredients();
}
