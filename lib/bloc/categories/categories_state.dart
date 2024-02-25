part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  List<CategoriesModel>? categoriesModelList;

  CategoriesState({this.categoriesModelList});

  CategoriesState.copyWith(
      {required List<CategoriesModel> categoriesModelListed}) {
    categoriesModelList = categoriesModelListed;
  }

  @override
  List<Object?> get props => [categoriesModelList];
}
