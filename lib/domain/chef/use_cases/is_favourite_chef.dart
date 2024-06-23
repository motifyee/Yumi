import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/chef/data/respositories/chef_repo.dart';

class IsFavouriteChef extends UseCase<bool, IsFavouriteChefParam> {
  final ChefRepo repo;

  IsFavouriteChef({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, bool>> call(IsFavouriteChefParam params) =>
      repo.isFavouriteChef(params.chefId).run();
}

class IsFavouriteChefParam extends Params {
  final String chefId;

  IsFavouriteChefParam(this.chefId);

  @override
  List<Object?> get props => [chefId];
}
