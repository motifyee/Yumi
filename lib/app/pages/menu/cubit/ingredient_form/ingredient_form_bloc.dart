import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yumi/app/pages/menu/meal_model.dart';

part 'ingredient_form_event.dart';
part 'ingredient_form_state.dart';

class IngredientFormBloc
    extends Bloc<IngredientFormEvent, IngredientFormState> {
  IngredientFormBloc()
      : super(IngredientFormState(
            ingredientsModelList: const [], ingredientsModelLength: 0)) {
    on<IngredientFormAddEvent>((event, emit) {
      List<IngredientsModel> data = List.from(state.ingredientsModelList);
      data.add(event.ingredientsModel.copyWith());
      emit(state.copyWith(ingredientsModel: data));
    });

    on<IngredientFormRemoveEvent>((event, emit) {
      List<IngredientsModel> data = List.from(state.ingredientsModelList);
      data.removeWhere((e) => e.id == event.ingredientsModel.id);
      emit(state.copyWith(ingredientsModel: data));
    });

    on<IngredientFormUpdateEvent>((event, emit) {
      emit(state.copyWith(ingredientsModel: List.from(event.ingredientsModel)));
    });
  }
}
