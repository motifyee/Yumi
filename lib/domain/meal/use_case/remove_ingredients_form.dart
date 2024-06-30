import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/meal/entity/ingredients.dart';

class RemoveIngredientsForm extends UseCase<List<Ingredients>, RemoveIngredientsFormParams> {
  @override
  Future<Either<Failure, List<Ingredients>>> call(RemoveIngredientsFormParams params) async {
    List<Ingredients> data = List.from(params.ingredients);
    data.removeWhere((e) => e.id == params.ingredient.id);
    return Right(data);
  }
}

class RemoveIngredientsFormParams extends Params {
  final Ingredients ingredient;
  final List<Ingredients> ingredients;

  RemoveIngredientsFormParams({required this.ingredient, required this.ingredients});

  @override
  List<Object?> get props => [ingredient, ingredients];
}
