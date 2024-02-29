part of 'meal_form_bloc.dart';

@immutable
class MealFormState extends Equatable {
  MealModel mealModel;

  MealFormState({required this.mealModel});

  MealFormState copyWith({required MealModel mealModel}) {
    return MealFormState(mealModel: mealModel);
  }

  @override
  List<Object?> get props => [mealModel];
}
