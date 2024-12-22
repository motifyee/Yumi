import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/domain/food_delivery/ingredients/data/repositories/ingredients_repo.dart';

class GetIngredients extends UseCase<List<Ingredient>, NoParams> {
  final IngredientsRepo repo;

  GetIngredients({IngredientsRepo? repo})
      : repo = repo ?? getIt<IngredientsRepo>();

  @override
  Future<Either<Failure, List<Ingredient>>> call(NoParams params) async {
    return await repo.getIngredients().run();
  }
}
