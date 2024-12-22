import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/chef/data/respositories/chef_repo.dart';

class GetChefWorkStatus
    extends UseCase<ChefWorkStatus, GetChefWorkStatusParams> {
  final ChefRepo repo;

  GetChefWorkStatus({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, ChefWorkStatus>> call(
          GetChefWorkStatusParams params) =>
      repo.getChefWorkStatus(params.chefId).run();
}

class GetChefWorkStatusParams extends Params {
  final String chefId;

  GetChefWorkStatusParams(this.chefId);

  @override
  List<Object?> get props => [chefId];
}
