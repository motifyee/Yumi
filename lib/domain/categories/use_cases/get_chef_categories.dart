import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/categories/data/repo/categories_repo.dart';
import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/statics/pagination.dart';

class GetChefCategories
    extends UseCase<Pagination<Category>, GetChefCategoriesParams> {
  final CategoriesRepo repo;

  GetChefCategories({CategoriesRepo? repo})
      : repo = repo ?? getIt<CategoriesRepo>();

  @override
  Future<Either<Failure, Pagination<Category>>> call(
    GetChefCategoriesParams params,
  ) =>
      repo
          .getChefCategories(
            isPreOrder: params.isPreOrder,
            pagination: params.pagination,
          )
          .run();
}

class GetChefCategoriesParams extends Params {
  final bool isPreOrder;
  final Pagination? pagination;

  GetChefCategoriesParams({this.isPreOrder = false, this.pagination});

  @override
  List<Object?> get props => [isPreOrder, pagination];
}
