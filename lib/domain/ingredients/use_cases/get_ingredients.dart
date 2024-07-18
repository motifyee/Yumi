import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/ingredients/data/repositories/ingredients_repo.dart';
import 'package:yumi/domain/ingredients/entities/ingredient.dart';

class GetIngredients extends UseCase<List<Ingredient>, NoParams> {
  final IngredientsRepo repo;

  GetIngredients({IngredientsRepo? repo})
      : repo = repo ?? getIt<IngredientsRepo>();

  @override
  Future<Either<Failure, List<Ingredient>>> call(NoParams params) async {
    return await repo.getIngredients().run();
  }
}
