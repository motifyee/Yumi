import 'package:common_code/common_code.dart';
import 'package:common_code/core/failures.dart';
import 'package:fpdart/src/task_either.dart';
import 'package:yumi/domain/ingredients/data/repo/ingredients_repo.dart';
import 'package:yumi/domain/ingredients/data/source/ingredients_source.dart';

class IngredientsRemoteRepo extends IngredientsRepo {
  final IngredientsSource ingredientsSource;

  IngredientsRemoteRepo({IngredientsSource? ingredientsSource})
      : ingredientsSource = ingredientsSource ?? getIt<IngredientsSource>();

  @override
  TaskEither<Failure, List<Ingredient>> getAllIngredients() {
    return TaskEither.tryCatch(() => ingredientsSource.getAllIngredients(),
        (error, stackTrace) => ServerFailure((error as CException).error));
  }
}
