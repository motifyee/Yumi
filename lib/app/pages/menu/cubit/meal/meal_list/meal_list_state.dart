part of 'meal_list_bloc.dart';

@immutable
class MealListState extends Equatable {
  List<MealModel> meals;
  int selectedCategory;
  Pager pager;
  MenuTarget menuTarget;
  int mealsLength;
  int changesCounter;

  Status status;

  MealListState({
    required this.meals,
    required this.selectedCategory,
    required this.pager,
    required this.menuTarget,
    this.status = Status.init,
    this.mealsLength = 0,
    this.changesCounter = 0,
  });

  MealListState copyWith({
    List<MealModel>? meals,
    int? selectedCategory,
    Pager? pager,
    Status? status,
  }) {
    return MealListState(
      meals: meals ?? this.meals,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      pager: pager ?? this.pager,
      menuTarget: menuTarget,
      status: status ?? this.status,
      mealsLength: meals?.length ?? 0,
      changesCounter: changesCounter + 1,
    );
  }

  @override
  List<Object?> get props =>
      [meals, selectedCategory, pager, menuTarget, mealsLength, changesCounter];
}
