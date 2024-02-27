part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  List<CategoriesModel> categoriesModelList;
  int categoriesModelListLength;
  int pageNumber;
  int lastPage;
  bool isLoading;

  CategoriesState(
      {required this.categoriesModelList,
      required this.categoriesModelListLength,
      required this.pageNumber,
      required this.lastPage,
      this.isLoading = false});

  CategoriesState copyWith(
      {List<CategoriesModel>? categoriesModelListed,
      int? pageNumber,
      int? lastPage,
      bool? isLoading}) {
    return CategoriesState(
        categoriesModelList: categoriesModelListed ?? this.categoriesModelList,
        categoriesModelListLength: categoriesModelListed != null
            ? categoriesModelListed.length
            : this.categoriesModelListLength,
        pageNumber: pageNumber ?? this.pageNumber,
        lastPage: lastPage ?? this.lastPage,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [
        categoriesModelList,
        categoriesModelListLength,
        pageNumber,
        lastPage,
        isLoading
      ];
}
