import 'package:common_code/core/failures.dart';
import 'package:common_code/core/use_cases.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/ingredients/entity/ingredients.dart';

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
