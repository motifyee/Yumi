import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/ingredients/data/repositories/ingredients_repo.dart';
import 'package:yumi/domain/ingredients/data/sources/ingredients_src.dart';
import 'package:yumi/domain/ingredients/entities/ingredient.dart';

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
