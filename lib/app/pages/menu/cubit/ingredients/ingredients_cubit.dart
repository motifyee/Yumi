import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';

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
