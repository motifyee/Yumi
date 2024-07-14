import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/categories/data/repo/categories_repo.dart';
import 'package:yumi/domain/categories/entity/category.dart';

class GetCategories
    extends UseCase<PaginatedData<Category>, GetCategoriesParams> {
  final CategoriesRepo repo;

  GetCategories({CategoriesRepo? repo})
      : repo = repo ?? getIt<CategoriesRepo>();

  @override
  Future<Either<Failure, PaginatedData<Category>>> call(
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
  final PaginatedData? pagination;

  GetCategoriesParams({this.isPreOrder = false, this.pagination});

  @override
  List<Object?> get props => [isPreOrder, pagination];
}
