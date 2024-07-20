import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/domain/food_delivery/ingredients/entities/ingredient.dart';

class RemoveIngredientsForm
    extends UseCase<List<Ingredient>, RemoveIngredientsFormParams> {
  @override
  Future<Either<Failure, List<Ingredient>>> call(
      RemoveIngredientsFormParams params) async {
    List<Ingredient> data = List.from(params.ingredients);
    data.removeWhere((e) => e.id == params.ingredient.id);
    return Right(data);
  }
}

class RemoveIngredientsFormParams extends Params {
  final Ingredient ingredient;
  final List<Ingredient> ingredients;

  RemoveIngredientsFormParams(
      {required this.ingredient, required this.ingredients});

  @override
  List<Object?> get props => [ingredient, ingredients];
}
