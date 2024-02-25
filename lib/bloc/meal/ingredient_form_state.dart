part of 'ingredient_form_bloc.dart';

@immutable
class IngredientFormState extends Equatable {
  IngredientsModel ingredientsModel;

  IngredientFormState({required this.ingredientsModel});

  IngredientFormState copyWith({required IngredientsModel ingredientsModel}) {
    return IngredientFormState(ingredientsModel: ingredientsModel);
  }

  @override
  List<Object?> get props => [ingredientsModel];
}
