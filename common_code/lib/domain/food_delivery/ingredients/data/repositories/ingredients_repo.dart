import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/domain/food_delivery/ingredients/entities/ingredient.dart';

abstract class IngredientsRepo {
  TaskEither<Failure, List<Ingredient>> getIngredients();
}
