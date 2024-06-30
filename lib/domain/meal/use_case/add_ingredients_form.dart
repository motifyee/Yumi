import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/meal/entity/ingredients.dart';

class AddIngredientsForm extends UseCase<List<Ingredients>, AddIngredientsFormParams> {
  @override
  Future<Either<Failure, List<Ingredients>>> call(AddIngredientsFormParams params) async {
    List<Ingredients> data = List.from(params.ingredients);
    data.add(params.ingredient);
    return Right(data);
  }
}

class AddIngredientsFormParams extends Params {
  final Ingredients ingredient;
  final List<Ingredients> ingredients;

  AddIngredientsFormParams({required this.ingredients, required this.ingredient});

  @override
  List<Object?> get props => [ingredient, ingredients];
}
