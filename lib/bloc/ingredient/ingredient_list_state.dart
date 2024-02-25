part of 'ingredient_list_bloc.dart';

@immutable
class IngredientListState extends Equatable {
  List<IngredientsModel> ingredients;

  IngredientListState({required this.ingredients});

  IngredientListState copyWith({required List<IngredientsModel> ingredients}) {
    return IngredientListState(ingredients: ingredients);
  }

  @override
  List<Object?> get props => [ingredients];
}
