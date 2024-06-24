import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yumi/app/pages/menu/meal.dart';

part 'meal_form_event.dart';
part 'meal_form_state.dart';

class MealFormBloc extends Bloc<MealFormEvent, MealFormState> {
  MealFormBloc() : super(MealFormState(mealModel: Meal())) {
    on<MealFormUpdateEvent>((event, emit) {
      emit(state.copyWith(mealModel: event.mealModel));
    });
  }
}
