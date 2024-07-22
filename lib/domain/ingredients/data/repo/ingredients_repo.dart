import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';

abstract class IngredientsRepo {
  TaskEither<Failure, List<Ingredient>> getAllIngredients();
}
