import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yumi/model/meal_model.dart';

part 'ingredient_form_event.dart';
part 'ingredient_form_state.dart';

class IngredientFormBloc
    extends Bloc<IngredientFormEvent, IngredientFormState> {
  IngredientFormBloc()
      : super(IngredientFormState(ingredientsModel: IngredientsModel())) {
    on<IngredientFormUpdateEvent>((event, emit) {
      emit(state.copyWith(ingredientsModel: event.ingredientsModel));
    });
  }
}
