import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/chef/data/respositories/chef_repo.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/domain/chef/entity/chef_work_status.dart';
import 'package:yumi/statics/pagination.dart';

class GetChefs extends UseCase<Pagination<Chef>, GetChefsParam> {
  final ChefRepo repo;

  GetChefs({ChefRepo? repo}) : repo = repo ?? getIt<ChefRepo>();

  @override
  Future<Either<Failure, Pagination<Chef>>> call(GetChefsParam params) => repo
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
