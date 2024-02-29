part of 'meal_list_bloc.dart';

@immutable
class MealListState extends Equatable {
  List<MealModel> meals;
  int selectedCategory;
  PaginationHelper paginationHelper;

  MealListState(
      {required this.meals,
      required this.selectedCategory,
      required this.paginationHelper});

  MealListState copyWith(
      {List<MealModel>? meals,
      int? selectedCategory,
      PaginationHelper? paginationHelper}) {
    return MealListState(
      meals: meals ?? this.meals,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      paginationHelper: paginationHelper ?? this.paginationHelper,
    );
  }

  @override
  List<Object?> get props => [meals, selectedCategory, paginationHelper];
}
