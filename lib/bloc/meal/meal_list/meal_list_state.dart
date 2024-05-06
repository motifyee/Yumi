part of 'meal_list_bloc.dart';

@immutable
class MealListState extends Equatable {
  List<MealModel> meals;
  int selectedCategory;
  PaginationHelper paginationHelper;
  MenuTarget menuTarget;
  int mealsLength;

  Status status;

  MealListState({
    required this.meals,
    required this.selectedCategory,
    required this.paginationHelper,
    required this.menuTarget,
    this.status = Status.init,
    this.mealsLength = 0,
  });

  MealListState copyWith({
    List<MealModel>? meals,
    int? selectedCategory,
    PaginationHelper? paginationHelper,
    Status? status,
  }) {
    return MealListState(
      meals: meals ?? this.meals,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      paginationHelper: paginationHelper ?? this.paginationHelper,
      menuTarget: menuTarget,
      status: status ?? this.status,
      mealsLength: meals?.length ?? 0,
    );
  }

  @override
  List<Object?> get props =>
      [meals, selectedCategory, paginationHelper, menuTarget, mealsLength];
}
