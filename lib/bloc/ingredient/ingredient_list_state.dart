part of 'ingredient_list_bloc.dart';

@immutable
class IngredientListState extends Equatable {
  List<Ingredients> ingredients;
  bool loading;

  IngredientListState({required this.ingredients, this.loading = false});

  IngredientListState copyWith({List<Ingredients>? ingredients, bool? loading}) {
    return IngredientListState(ingredients: ingredients ?? this.ingredients, loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [ingredients, loading];
}
