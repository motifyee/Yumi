import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/statics/pagination.dart';

abstract class CategoriesRepo {
  TaskEither<Failure, Pagination<Category>> getCategories({
    bool isPreOrder = false,
    Pagination? pagination,
  });
  TaskEither<Failure, Pagination<Category>> getChefCategories({
    bool isPreOrder = false,
    Pagination? pagination,
  });
  TaskEither<Failure, Pagination<Category>> getCustomerCategories({
    bool isPreOrder = false,
    double? latitude,
    double? longitude,
    Pagination? pagination,
  });
  TaskEither<Failure, Pagination<Category>> getCustomerCategoriesByChefId({
    required String chefId,
    bool isPreOrder = false,
    Pagination? pagination,
  });
}
