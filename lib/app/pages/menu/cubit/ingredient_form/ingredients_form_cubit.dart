import 'package:dependencies/dependencies.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/core/failures.dart';
import 'package:common_code/domain/food_delivery/ingredients/entities/ingredient.dart';
import 'package:common_code/domain/food_delivery/meal/use_cases/add_ingredients_form.dart';
import 'package:common_code/domain/food_delivery/meal/use_cases/remove_ingredients_form.dart';
import 'package:yumi/global.dart';

part 'ingredients_form_cubit.freezed.dart';
part 'ingredients_form_cubit.g.dart';

@freezed
class IngredientsFormState with _$IngredientsFormState {
  const factory IngredientsFormState(
      {required List<Ingredient> ingredientsModelList}) = _IngredientsState;

  factory IngredientsFormState.initial() =>
      const IngredientsFormState(ingredientsModelList: []);

  factory IngredientsFormState.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFormStateFromJson(json);
}

class IngredientsFormCubit extends Cubit<IngredientsFormState> {
  IngredientsFormCubit() : super(IngredientsFormState.initial());

  add({required Ingredient ingredientsModel}) async {
    final Either<Failure, List<Ingredient>> task = await AddIngredientsForm()
        .call(AddIngredientsFormParams(
            ingredients: state.ingredientsModelList,
            ingredient: ingredientsModel));
    task.fold((l) => G().snackBar("Cant add Ingredient"),
        (r) => emit(state.copyWith(ingredientsModelList: r)));
  }

  remove({required Ingredient ingredientsModel}) async {
    final Either<Failure, List<Ingredient>> task = await RemoveIngredientsForm()
        .call(RemoveIngredientsFormParams(
            ingredients: state.ingredientsModelList,
            ingredient: ingredientsModel));
    task.fold((l) => G().snackBar("Cant remove Ingredient"),
        (r) => emit(state.copyWith(ingredientsModelList: r)));
  }

  update({required List<Ingredient> ingredientsModel}) {
    emit(state.copyWith(ingredientsModelList: List.from(ingredientsModel)));
  }
}
