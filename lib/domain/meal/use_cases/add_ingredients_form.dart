import 'package:common_code/core/failures.dart';
import 'package:common_code/core/use_cases.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/ingredients/entities/ingredient.dart';

class AddIngredientsForm
    extends UseCase<List<Ingredient>, AddIngredientsFormParams> {
  @override
  Future<Either<Failure, List<Ingredient>>> call(
      AddIngredientsFormParams params) async {
    List<Ingredient> data = List.from(params.ingredients);
    data.add(params.ingredient);
    return Right(data);
  }
}

class AddIngredientsFormParams extends Params {
  final Ingredient ingredient;
  final List<Ingredient> ingredients;

  AddIngredientsFormParams(
      {required this.ingredients, required this.ingredient});

  @override
  List<Object?> get props => [ingredient, ingredients];
}
