part of 'ingredient_form_bloc.dart';

class IngredientFormState extends Equatable {
  List<Ingredient> ingredientsModelList;
  int ingredientsModelLength;

  IngredientFormState(
      {required this.ingredientsModelList,
      required this.ingredientsModelLength});

  IngredientFormState copyWith({required List<Ingredient> ingredientsModel}) {
    return IngredientFormState(
        ingredientsModelList: ingredientsModel,
        ingredientsModelLength: ingredientsModel.length);
  }

  @override
  List<Object?> get props => [ingredientsModelList, ingredientsModelLength];
}
