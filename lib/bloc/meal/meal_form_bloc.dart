import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yumi/model/meal_model.dart';

part 'meal_form_event.dart';
part 'meal_form_state.dart';

class MealFormBloc extends Bloc<MealFormEvent, MealFormState> {
  MealFormBloc() : super(MealFormState(mealModel: MealModel())) {
    on<MealFormUpdateEvent>((event, emit) {
      emit(MealFormState.copyWith(mealModel: event.mealModel));
    });
  }
}
