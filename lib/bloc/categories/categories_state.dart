part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  List<CategoriesModel> categoriesModelList;
  int categoriesModelListLength;
  PaginationHelper paginationHelper;

  CategoriesState(
      {required this.categoriesModelList,
      required this.categoriesModelListLength,
      required this.paginationHelper});

  CategoriesState copyWith(
      {List<CategoriesModel>? categoriesModelListed,
      PaginationHelper? paginationHelper}) {
    return CategoriesState(
        categoriesModelList: categoriesModelListed ?? categoriesModelList,
        categoriesModelListLength: categoriesModelListed != null
            ? categoriesModelListed.length
            : categoriesModelListLength,
        paginationHelper: paginationHelper ?? this.paginationHelper);
  }

  @override
  List<Object?> get props =>
      [categoriesModelList, categoriesModelListLength, paginationHelper];
}
