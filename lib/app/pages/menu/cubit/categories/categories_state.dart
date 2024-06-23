part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  List<CategoriesModel> categoriesModelList;
  int categoriesModelListLength;
  Pager pager;

  CategoriesState(
      {required this.categoriesModelList,
      required this.categoriesModelListLength,
      required this.pager});

  CategoriesState copyWith(
      {List<CategoriesModel>? categoriesModelListed, Pager? pager}) {
    return CategoriesState(
        categoriesModelList: categoriesModelListed ?? categoriesModelList,
        categoriesModelListLength: categoriesModelListed != null
            ? categoriesModelListed.length
            : categoriesModelListLength,
        pager: pager ?? this.pager);
  }

  @override
  List<Object?> get props =>
      [categoriesModelList, categoriesModelListLength, pager];
}
