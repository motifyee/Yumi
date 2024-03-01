part of 'meal_list_bloc.dart';

@immutable
class MealListState extends Equatable {
  List<MealModel> meals;
  int selectedCategory;
  PaginationHelper paginationHelper;
  MenuTarget menuTarget;

  MealListState({
    required this.meals,
    required this.selectedCategory,
    required this.paginationHelper,
    required this.menuTarget,
  });

  MealListState copyWith(
      {List<MealModel>? meals,
      int? selectedCategory,
      PaginationHelper? paginationHelper}) {
    return MealListState(
      meals: meals ?? this.meals,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      paginationHelper: paginationHelper ?? this.paginationHelper,
      menuTarget: this.menuTarget,
    );
  }

  @override
  List<Object?> get props =>
      [meals, selectedCategory, paginationHelper, menuTarget];
}
