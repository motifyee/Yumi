import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/ingredients/entity/ingredients.dart';

abstract class IngredientsRepo {
  TaskEither<Failure, List<Ingredients>> getAllIngredients();
}
