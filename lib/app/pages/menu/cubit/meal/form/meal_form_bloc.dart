import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/app/pages/menu/meal.dart';

part 'meal_form_event.dart';
part 'meal_form_state.dart';

class MealFormBloc extends Bloc<MealFormEvent, MealFormState> {
  MealFormBloc() : super(MealFormState(mealModel: const Meal())) {
    on<MealFormUpdateEvent>((event, emit) {
      emit(state.copyWith(mealModel: event.mealModel));
    });
  }
}
