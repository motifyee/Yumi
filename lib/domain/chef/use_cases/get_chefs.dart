import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/chef/data/respositories/chef_repo.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/statics/pagination.dart';

class GetChefs extends UseCase<List<Chef>, GetChefsParam> {
  final ChefRepo repo;

  GetChefs({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, List<Chef>>> call(GetChefsParam params) => repo
      .getChefs(
        isPreOrder: params.isPreOrder,
        latitude: params.latitude,
        longitude: params.longitude,
        status: params.status,
        pagination: params.pagination,
      )
      .run();
}

class GetChefsParam extends Params {
  final bool isPreOrder;
  final double latitude;
  final double longitude;
  final ChefWorkStatus status;
  final Pagination pagination;

  GetChefsParam({
    required this.isPreOrder,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.pagination,
  });

  @override
  List<Object?> get props =>
      [isPreOrder, latitude, longitude, status, pagination];
}
