import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/ingredients/entities/ingredient.dart';

abstract class IngredientsRepo {
  TaskEither<Failure, List<Ingredient>> getIngredients();
}
