import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/chef/data/respositories/chef_repo.dart';

class AddFavouriteChef extends UseCase<bool, AddFavouriteChefParams> {
  final ChefRepo repo;

  AddFavouriteChef({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, bool>> call(AddFavouriteChefParams params) =>
      repo.addFavouriteChef(params.chefId).run();
}

class AddFavouriteChefParams extends Params {
  final String chefId;

  AddFavouriteChefParams(this.chefId);

  @override
  List<Object?> get props => [chefId];
}
