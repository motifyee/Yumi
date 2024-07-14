import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:common_code/core/failures.dart';
import 'package:yumi/domain/meal/entity/ingredients.dart';
import 'package:yumi/domain/meal/use_case/add_ingredients_form.dart';
import 'package:yumi/domain/meal/use_case/remove_ingredients_form.dart';
import 'package:yumi/global.dart';

part 'ingredients_form_cubit.freezed.dart';
part 'ingredients_form_cubit.g.dart';

@freezed
class IngredientsFormState with _$IngredientsFormState {
  const factory IngredientsFormState(
      {required List<Ingredients> ingredientsModelList}) = _IngredientsState;

  factory IngredientsFormState.initial() =>
      const IngredientsFormState(ingredientsModelList: []);

  factory IngredientsFormState.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFormStateFromJson(json);
}

class IngredientsFormCubit extends Cubit<IngredientsFormState> {
  IngredientsFormCubit() : super(IngredientsFormState.initial());

  add({required Ingredients ingredientsModel}) async {
    final Either<Failure, List<Ingredients>> task = await AddIngredientsForm()
        .call(AddIngredientsFormParams(
            ingredients: state.ingredientsModelList,
            ingredient: ingredientsModel));
    task.fold((l) => G().snackBar("Cant add Ingredient"),
        (r) => emit(state.copyWith(ingredientsModelList: r)));
  }

  remove({required Ingredients ingredientsModel}) async {
    final Either<Failure, List<Ingredients>> task =
        await RemoveIngredientsForm().call(RemoveIngredientsFormParams(
            ingredients: state.ingredientsModelList,
            ingredient: ingredientsModel));
    task.fold((l) => G().snackBar("Cant remove Ingredient"),
        (r) => emit(state.copyWith(ingredientsModelList: r)));
  }

  update({required List<Ingredients> ingredientsModel}) {
    emit(state.copyWith(ingredientsModelList: List.from(ingredientsModel)));
  }
}
