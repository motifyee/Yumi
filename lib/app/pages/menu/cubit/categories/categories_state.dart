part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  List<CategoriesModel> categoriesModelList;
  int categoriesModelListLength;
  Pagination pagination;

  CategoriesState(
      {required this.categoriesModelList,
      required this.categoriesModelListLength,
      required this.pagination});

  CategoriesState copyWith(
      {List<CategoriesModel>? categoriesModelListed, Pagination? pagination}) {
    return CategoriesState(
        categoriesModelList: categoriesModelListed ?? categoriesModelList,
        categoriesModelListLength: categoriesModelListed != null
            ? categoriesModelListed.length
            : categoriesModelListLength,
        pagination: pagination ?? this.pagination);
  }

  @override
  List<Object?> get props =>
      [categoriesModelList, categoriesModelListLength, pagination];
}
