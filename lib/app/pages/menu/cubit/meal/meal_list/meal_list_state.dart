part of 'meal_list_bloc.dart';

@immutable
class MealListState extends Equatable {
  List<Meal> meals;
  int selectedCategory;
  PaginatedData pagination;
  MenuTarget menuTarget;
  int mealsLength;
  int changesCounter;

  Status status;

  MealListState({
    required this.meals,
    required this.selectedCategory,
    required this.pagination,
    required this.menuTarget,
    this.status = Status.init,
    this.mealsLength = 0,
    this.changesCounter = 0,
  });

  MealListState copyWith({
    List<Meal>? meals,
    int? selectedCategory,
    PaginatedData? pagination,
    Status? status,
  }) {
    return MealListState(
      meals: meals ?? this.meals,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      pagination: pagination ?? this.pagination,
      menuTarget: menuTarget,
      status: status ?? this.status,
      mealsLength: meals?.length ?? 0,
      changesCounter: changesCounter + 1,
    );
  }

  @override
  List<Object?> get props => [
        meals,
        selectedCategory,
        pagination,
        menuTarget,
        mealsLength,
        changesCounter
      ];
}
