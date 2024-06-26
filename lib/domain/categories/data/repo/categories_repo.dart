import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/statics/paginatedData.dart';

abstract class CategoriesRepo {
  TaskEither<Failure, PaginatedData<Category>> getCategories({
    bool isPreOrder = false,
    PaginatedData? pagination,
  });
  TaskEither<Failure, PaginatedData<Category>> getChefCategories({
    bool isPreOrder = false,
    PaginatedData? pagination,
  });
  TaskEither<Failure, PaginatedData<Category>> getCustomerCategories({
    bool isPreOrder = false,
    double? latitude,
    double? longitude,
    PaginatedData? pagination,
  });
  TaskEither<Failure, PaginatedData<Category>> getCustomerCategoriesByChefId({
    required String chefId,
    bool isPreOrder = false,
    PaginatedData? pagination,
  });
}
