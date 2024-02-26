part of 'ingredient_form_bloc.dart';

@immutable
class IngredientFormState extends Equatable {
  List<IngredientsModel> ingredientsModelList;
  int ingredientsModelLength;

  IngredientFormState(
      {required this.ingredientsModelList,
      required this.ingredientsModelLength});

  IngredientFormState copyWith(
      {required List<IngredientsModel> ingredientsModel}) {
    return IngredientFormState(
        ingredientsModelList: ingredientsModel,
        ingredientsModelLength: ingredientsModel.length);
  }

  @override
  List<Object?> get props => [ingredientsModelList, ingredientsModelLength];
}
