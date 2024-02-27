part of 'meal_list_bloc.dart';

@immutable
class MealListState extends Equatable {
  final List<dynamic> meals;
  final int selectedCategory;

  const MealListState({required this.meals, required this.selectedCategory});

  MealListState copyWith({List<dynamic>? meals, int? selectedCategory}) {
    return MealListState(
        meals: meals ?? this.meals,
        selectedCategory: selectedCategory ?? this.selectedCategory);
  }

  @override
  List<Object?> get props => [meals, selectedCategory];
}
