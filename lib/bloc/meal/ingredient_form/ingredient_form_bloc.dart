import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yumi/model/meal_model.dart';

part 'ingredient_form_event.dart';
part 'ingredient_form_state.dart';

class IngredientFormBloc
    extends Bloc<IngredientFormEvent, IngredientFormState> {
  IngredientFormBloc()
      : super(IngredientFormState(
            ingredientsModelList: const [], ingredientsModelLength: 0)) {
    on<IngredientFormAddEvent>((event, emit) {
      List<IngredientsModel> data = state.ingredientsModelList;
      data.add(event.ingredientsModel.copyWith());
      emit(state.copyWith(ingredientsModel: data));
    });
    on<IngredientFormRemoveEvent>((event, emit) {
      List<IngredientsModel> data = state.ingredientsModelList;
      data.removeWhere((e) => e.id == event.ingredientsModel.id);
      emit(state.copyWith(ingredientsModel: data));
    });
    on<IngredientFormUpdateEvent>((event, emit) {
      emit(state.copyWith(ingredientsModel: event.ingredientsModel));
    });
  }
}
