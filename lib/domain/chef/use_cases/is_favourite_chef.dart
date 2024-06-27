import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/chef/data/respositories/chef_repo.dart';

class IsFavouriteChef extends UseCase<bool, IsFavouriteChefParams> {
  final ChefRepo repo;

  IsFavouriteChef({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, bool>> call(IsFavouriteChefParams params) =>
      repo.isFavouriteChef(params.chefId).run();
}

class IsFavouriteChefParams extends Params {
  final String chefId;

  IsFavouriteChefParams(this.chefId);

  @override
  List<Object?> get props => [chefId];
}
