import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/domain/categories/data/repo/categories_repo.dart';
import 'package:yumi/domain/categories/data/source/categories_src.dart';
import 'package:yumi/statics/pagination.dart';

class CategoriesRemoteRepo implements CategoriesRepo {
  final CategoriesSrc categoriesSrc;

  CategoriesRemoteRepo({CategoriesSrc? categoriesSrc})
      : categoriesSrc = categoriesSrc ?? getIt<CategoriesSrc>();

  @override
  TaskEither<Failure, Pagination<Category>> getCategories({
    bool isPreOrder = false,
    Pagination? pagination,
  }) =>
      TaskEither.tryCatch(
        () => categoriesSrc.getCategories(
          isPreOrder: isPreOrder,
          pagination: pagination,
        ),
        (error, stackTrace) => FailureX.fromException(error, stackTrace),
      );

  @override
  TaskEither<Failure, Pagination<Category>> getChefCategories({
    bool isPreOrder = false,
    Pagination? pagination,
  }) =>
      TaskEither.tryCatch(
        () => categoriesSrc.getChefCategories(
          isPreOrder: isPreOrder,
          pagination: pagination,
        ),
        (error, stackTrace) => FailureX.fromException(error, stackTrace),
      );

  @override
  TaskEither<Failure, Pagination<Category>> getCustomerCategories({
    bool isPreOrder = false,
    double? latitude,
    double? longitude,
    Pagination? pagination,
  }) =>
      TaskEither.tryCatch(
        () => categoriesSrc.getCustomerCategories(
          isPreOrder: isPreOrder,
          latitude: latitude,
          longitude: longitude,
          pagination: pagination,
        ),
        (error, stackTrace) => FailureX.fromException(error, stackTrace),
      );

  @override
  TaskEither<Failure, Pagination<Category>> getCustomerCategoriesByChefId({
    required String chefId,
    bool isPreOrder = false,
    Pagination? pagination,
  }) =>
      TaskEither.tryCatch(
        () => categoriesSrc.getCustomerCategoriesByChefId(
          chefId: chefId,
          isPreOrder: isPreOrder,
          pagination: pagination,
        ),
        (error, stackTrace) => FailureX.fromException(error, stackTrace),
      );
}
