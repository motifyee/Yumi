import 'package:common_code/common_code.dart';
import 'package:yumi/domain/ingredients/entity/ingredients.dart';

abstract class IngredientsSource {
  Future<List<Ingredients>> getAllIngredients();
}
