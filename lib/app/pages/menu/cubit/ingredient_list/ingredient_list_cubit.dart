import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/util/global_context.dart';
import 'package:yumi/domain/ingredients/use_case/get_all_ingredients.dart';

part 'ingredient_list_cubit.g.dart';

part 'ingredient_list_cubit.freezed.dart';

@freezed
class IngredientListState with _$IngredientListState {
  const factory IngredientListState({
    required List<Ingredient> ingredients,
    required bool loading,
  }) = _IngredientListState;

  factory IngredientListState.initial() {
    return const IngredientListState(ingredients: [], loading: false);
  }

  factory IngredientListState.fromJson(Map<String, dynamic> json) =>
      _$IngredientListStateFromJson(json);
}

class IngredientListCubit extends Cubit<IngredientListState> {
  IngredientListCubit() : super(IngredientListState.initial());

  getAllIngredients() async {
    emit(state.copyWith(loading: false));
    final task = await GetAllIngredients().call(NoParams());

    task.fold(
      (l) => GlobalContext().snackBar(l.error ?? ''),
      (r) => emit(state.copyWith(ingredients: r, loading: false)),
    );
  }
}
