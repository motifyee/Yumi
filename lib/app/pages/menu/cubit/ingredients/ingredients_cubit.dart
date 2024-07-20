import 'package:bloc/bloc.dart';
import 'package:common_code/common_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common_code/domain/food_delivery/ingredients/entities/ingredient.dart';
import 'package:common_code/domain/food_delivery/ingredients/use_cases/get_ingredients.dart';

part 'ingredients_cubit.freezed.dart';

@freezed
class IngredientsState with _$IngredientsState {
  const factory IngredientsState({
    @Default([]) List<Ingredient> ingredients,
    @Default(false) bool loading,
  }) = _IngredientsState;
}

class IngredientsCubit extends Cubit<IngredientsState> {
  IngredientsCubit() : super(const IngredientsState());

  void getIngredients() async {
    emit(state.copyWith(loading: true));

    final task = await GetIngredients().call(NoParams());
    task.fold(
      (l) => emit(state.copyWith(loading: false)),
      (r) => emit(state.copyWith(ingredients: r, loading: false)),
    );
  }
}
