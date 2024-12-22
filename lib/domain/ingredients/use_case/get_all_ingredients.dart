import 'package:common_code/common_code.dart';
import 'package:fpdart/src/either.dart';
import 'package:yumi/domain/ingredients/data/repo/ingredients_repo.dart';

class GetAllIngredients extends UseCase<List<Ingredient>, NoParams> {
  final IngredientsRepo ingredientsRepo;

  GetAllIngredients({IngredientsRepo? ingredientsRepo})
      : ingredientsRepo = ingredientsRepo ?? getIt<IngredientsRepo>();

  @override
  Future<Either<Failure, List<Ingredient>>> call(NoParams params) {
    return ingredientsRepo.getAllIngredients().run();
  }
}
