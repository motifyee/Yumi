part of 'meal_list_bloc.dart';

@immutable
class MealListState extends Equatable {
  List<dynamic> meals;
  int selectedCategory;

  MealListState({required this.meals, required this.selectedCategory});

  @override
  List<Object?> get props => [meals, selectedCategory];
}
