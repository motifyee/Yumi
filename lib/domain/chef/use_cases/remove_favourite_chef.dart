import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/chef/data/respositories/chef_repo.dart';

class RemoveFavouriteChef extends UseCase<bool, RemoveFavouriteChefParam> {
  final ChefRepo repo;

  RemoveFavouriteChef({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, bool>> call(RemoveFavouriteChefParam params) =>
      repo.removeFavouriteChef(params.chefId).run();
}

class RemoveFavouriteChefParam extends Params {
  final String chefId;

  RemoveFavouriteChefParam(this.chefId);

  @override
  List<Object?> get props => [chefId];
}
