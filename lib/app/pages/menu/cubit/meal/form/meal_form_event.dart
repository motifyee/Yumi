part of 'meal_form_bloc.dart';

@immutable
abstract class MealFormEvent {}

class MealFormUpdateEvent implements MealFormEvent {
  Meal mealModel;

  MealFormUpdateEvent({required this.mealModel});
}
