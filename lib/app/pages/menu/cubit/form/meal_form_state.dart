part of 'meal_form_bloc.dart';

@immutable
class MealFormState extends Equatable {
  Meal mealModel;

  MealFormState({required this.mealModel});

  MealFormState copyWith({required Meal mealModel}) {
    return MealFormState(mealModel: mealModel);
  }

  @override
  List<Object?> get props => [mealModel];
}
