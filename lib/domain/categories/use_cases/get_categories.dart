import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/categories/data/repo/categories_repo.dart';
import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/statics/pagination.dart';

class GetCategories extends UseCase<Pagination<Category>, GetCategoriesParams> {
  final CategoriesRepo repo;

  GetCategories({CategoriesRepo? repo})
      : repo = repo ?? getIt<CategoriesRepo>();

  @override
  Future<Either<Failure, Pagination<Category>>> call(
    GetCategoriesParams params,
  ) =>
      repo
          .getCategories(
            isPreOrder: params.isPreOrder,
            pagination: params.pagination,
          )
          .run();
}

class GetCategoriesParams extends Params {
  final bool isPreOrder;
  final Pagination? pagination;

  GetCategoriesParams({this.isPreOrder = false, this.pagination});

  @override
  List<Object?> get props => [isPreOrder, pagination];
}
