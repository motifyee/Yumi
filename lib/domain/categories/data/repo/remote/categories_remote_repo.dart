import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/exceptions.dart';
import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/domain/categories/data/repo/categories_repo.dart';
import 'package:yumi/domain/categories/data/source/categories_src.dart';
import 'package:yumi/statics/paginatedData.dart';

class CategoriesRemoteRepo implements CategoriesRepo {
  final CategoriesSrc categoriesSrc;

  CategoriesRemoteRepo({CategoriesSrc? categoriesSrc})
      : categoriesSrc = categoriesSrc ?? getIt<CategoriesSrc>();

  @override
  TaskEither<Failure, PaginatedData<Category>> getCategories({
    bool isPreOrder = false,
    PaginatedData? pagination,
  }) =>
      TaskEither.tryCatch(
        () => categoriesSrc.getCategories(
          isPreOrder: isPreOrder,
          pagination: pagination,
        ),
        (error, stackTrace) => Failure.fromException(error as CException),
      );

  @override
  TaskEither<Failure, PaginatedData<Category>> getChefCategories({
    bool isPreOrder = false,
    PaginatedData? pagination,
  }) =>
      TaskEither.tryCatch(
        () => categoriesSrc.getChefCategories(
          isPreOrder: isPreOrder,
          pagination: pagination,
        ),
        (error, stackTrace) => Failure.fromException(error as CException),
      );

  @override
  TaskEither<Failure, PaginatedData<Category>> getCustomerCategories({
    bool isPreOrder = false,
    double? latitude,
    double? longitude,
    PaginatedData? pagination,
  }) =>
      TaskEither.tryCatch(
        () => categoriesSrc.getCustomerCategories(
          isPreOrder: isPreOrder,
          latitude: latitude,
          longitude: longitude,
          pagination: pagination,
        ),
        (error, stackTrace) => Failure.fromException(error as CException),
      );

  @override
  TaskEither<Failure, PaginatedData<Category>> getCustomerCategoriesByChefId({
    required String chefId,
    bool isPreOrder = false,
    PaginatedData? pagination,
  }) =>
      TaskEither.tryCatch(
        () => categoriesSrc.getCustomerCategoriesByChefId(
          chefId: chefId,
          isPreOrder: isPreOrder,
          pagination: pagination,
        ),
        (error, stackTrace) => Failure.fromException(error as CException),
      );
}
