import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/chef/data/respositories/chef_repo.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/statics/paginatedData.dart';
import 'package:yumi/statics/pagination.dart';

class GetFavouriteChefs
    extends UseCase<PaginatedData<Chef>, GetFavouriteChefsParam> {
  final ChefRepo repo;

  GetFavouriteChefs({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, PaginatedData<Chef>>> call(
          GetFavouriteChefsParam params) =>
      repo.getFavouriteChefs(params.pagination).run();
}

class GetFavouriteChefsParam extends Params {
  final Pagination pagination;

  GetFavouriteChefsParam(this.pagination);

  @override
  List<Object?> get props => [pagination];
}
