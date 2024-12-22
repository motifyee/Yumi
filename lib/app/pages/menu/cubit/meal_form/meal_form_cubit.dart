import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/util/global_context.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/global.dart';

part 'meal_form_cubit.freezed.dart';
part 'meal_form_cubit.g.dart';

@freezed
class MealFormState with _$MealFormState {
  const factory MealFormState({
    required Meal mealModel,
    required bool isLoading,
  }) = _MealFormState;

  factory MealFormState.initial() => MealFormState(
        mealModel: Meal(code: CodeGenerator.getRandomCode()),
        isLoading: false,
      );

  factory MealFormState.fromJson(Map<String, dynamic> json) =>
      _$MealFormStateFromJson(json);
}

class MealFormCubit extends Cubit<MealFormState> {
  MealFormCubit() : super(MealFormState.initial());

  resetForm() {
    emit(MealFormState.initial());
  }

  updateLoading({required bool isLoading}) {
    emit(state.copyWith(isLoading: isLoading));
  }

  Future<void> update({required Meal mealModel}) async {
    final Either<Failure, Meal> task =
        await UpdateMealForm().call(UpdateMealFormParams(meal: mealModel));
    task.fold(
      (l) => G().snackBar('Try again'),
      (r) => emit(state.copyWith(mealModel: r, isLoading: false)),
    );
  }

  updateIngredients({required List<Ingredient> ingredients}) async {
    final Either<Failure, Meal> task = await AddIngredientsToMeal().call(
      AddIngredientsToMealParams(
        ingredients: ingredients,
        meal: state.mealModel,
      ),
    );
    task.fold(
      (l) => G().snackBar('Try again'),
      (r) => emit(state.copyWith(mealModel: r)),
    );
  }

  updateMeal({required Meal meal}) async {
    final task =
        await UpdateMeal().call(UpdateMealParams(meal: state.mealModel));
    task.fold((l) => GlobalContext().snackBar(l.error ?? ''), (r) {
      GlobalContext().snackBar(r.toString());
      GlobalContext().pop();
    });
  }

  createMeal({required Meal meal}) async {
    final task =
        await CreateMeal().call(CreateMealParams(meal: state.mealModel));
    task.fold((l) => GlobalContext().snackBar(l.error ?? ''), (r) {
      GlobalContext().snackBar(r.toString());
      GlobalContext().pop();
    });
  }
}
