import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/chef/data/respositories/chef_repo.dart';

class GetChefs extends UseCase<PaginatedData<Chef>, GetChefsParam> {
  final ChefRepo repo;

  GetChefs({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, PaginatedData<Chef>>> call(GetChefsParam params) =>
      repo
          .getChefs(
            isPreOrder: params.isPreOrder,
            latitude: params.latitude,
            longitude: params.longitude,
            workStatus: params.status,
            pagination: params.pagination,
          )
          .run();
}

class GetChefsParam extends Params {
  final bool isPreOrder;
  final ChefWorkStatus? status;
  final double latitude;
  final double longitude;
  final Pagination pagination;

  GetChefsParam({
    required this.isPreOrder,
    this.status,
    required this.latitude,
    required this.longitude,
    required this.pagination,
  });

  @override
  List<Object?> get props =>
      [isPreOrder, status, latitude, longitude, pagination];
}
