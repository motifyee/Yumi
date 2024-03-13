part of 'meal_list_bloc.dart';

@immutable
class MealListState extends Equatable {
  List<MealModel> meals;
  int selectedCategory;
  PaginationHelper paginationHelper;
  MenuTarget menuTarget;

  BlocStatus status;

  MealListState({
    required this.meals,
    required this.selectedCategory,
    required this.paginationHelper,
    required this.menuTarget,
    this.status = BlocStatus.init,
  });

  MealListState copyWith({
    List<MealModel>? meals,
    int? selectedCategory,
    PaginationHelper? paginationHelper,
    BlocStatus? status,
  }) {
    return MealListState(
      meals: meals ?? this.meals,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      paginationHelper: paginationHelper ?? this.paginationHelper,
      menuTarget: menuTarget,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [meals, selectedCategory, paginationHelper, menuTarget];
}
