import 'package:common_code/common_code.dart';

abstract class IngredientsSource {
  Future<List<Ingredient>> getAllIngredients();
}
