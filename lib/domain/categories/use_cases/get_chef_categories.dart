import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/categories/data/repo/categories_repo.dart';
import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/statics/paginatedData.dart';

class GetChefCategories
    extends UseCase<PaginatedData<Category>, GetChefCategoriesParams> {
  final CategoriesRepo repo;

  GetChefCategories({CategoriesRepo? repo})
      : repo = repo ?? getIt<CategoriesRepo>();

  @override
  Future<Either<Failure, PaginatedData<Category>>> call(
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
  final PaginatedData? pagination;

  GetChefCategoriesParams({this.isPreOrder = false, this.pagination});

  @override
  List<Object?> get props => [isPreOrder, pagination];
}
