import 'package:bloc/bloc.dart';
import 'package:common_code/util/global_context.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:common_code/core/failures.dart';
import 'package:yumi/domain/ingredients/entity/ingredients.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/domain/meal/use_case/add_ingredients_to_meal.dart';
import 'package:yumi/domain/meal/use_case/create_meal.dart';
import 'package:yumi/domain/meal/use_case/update_meal.dart';
import 'package:yumi/domain/meal/use_case/update_meal_form.dart';
import 'package:yumi/global.dart';
import 'package:common_code/util/code_generator.dart';

part 'meal_form_cubit.freezed.dart';
part 'meal_form_cubit.g.dart';

@freezed
class MealFormState with _$MealFormState {
  const factory MealFormState({required Meal mealModel}) = _MealFormState;

  factory MealFormState.initial() => MealFormState(mealModel: Meal(code: CodeGenerator.getRandomCode()));

  factory MealFormState.fromJson(Map<String, dynamic> json) => _$MealFormStateFromJson(json);
}

class MealFormCubit extends Cubit<MealFormState> {
  MealFormCubit() : super(MealFormState.initial());

  update({required Meal mealModel}) async {
    final Either<Failure, Meal> task = await UpdateMealForm().call(UpdateMealFormParams(meal: mealModel));
    task.fold((l) => G().snackBar("Try again"), (r) => emit(state.copyWith(mealModel: r)));
  }

  updateIngredients({required List<Ingredients> ingredients}) async {
    final Either<Failure, Meal> task = await AddIngredientsToMeal().call(AddIngredientsToMealParams(ingredients: ingredients, meal: state.mealModel));
    task.fold((l) => G().snackBar("Try again"), (r) => emit(state.copyWith(mealModel: r)));
  }

  updateMeal({required Meal meal}) async {
    final task = await UpdateMeal().call(UpdateMealParams(meal: state.mealModel));
    task.fold((l) => GlobalContext().snackBar(l.error ?? ''), (r) {
      GlobalContext().snackBar(r.toString());
      GlobalContext().pop();
    });
  }

  createMeal({required Meal meal}) async {
    final task = await CreateMeal().call(CreateMealParams(meal: state.mealModel));
    task.fold((l) => GlobalContext().snackBar(l.error ?? ''), (r) {
      GlobalContext().snackBar(r.toString());
      GlobalContext().pop();
    });
  }
}
