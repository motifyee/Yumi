import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/domain/food_delivery/ingredients/data/repositories/ingredients_repo.dart';
import 'package:common_code/domain/food_delivery/ingredients/data/sources/ingredients_src.dart';
import 'package:common_code/domain/food_delivery/ingredients/entities/ingredient.dart';

class IngredientsRemoteRepo implements IngredientsRepo {
  final IngredientsSrc src;

  IngredientsRemoteRepo({IngredientsSrc? src})
      : src = src ?? getIt<IngredientsSrc>();

  @override
  TaskEither<Failure, List<Ingredient>> getIngredients() {
    return TaskEither.tryCatch(
      () => src.getIngredients(),
      (e, _) => Failure.fromException(e as CException),
    );
  }
}
