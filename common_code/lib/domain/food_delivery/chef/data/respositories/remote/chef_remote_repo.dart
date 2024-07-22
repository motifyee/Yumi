import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/chef/data/respositories/chef_repo.dart';
import 'package:common_code/domain/food_delivery/chef/data/sources/chef_src.dart';
import 'package:common_code/domain/food_delivery/chef/entity/chef.dart';
import 'package:common_code/domain/food_delivery/chef/entity/chef_work_status.dart';

import 'package:common_code/domain/entities/pagination.dart';

class ChefRemoteRepo implements ChefRepo {
  final ChefSrc chefSrc;

  ChefRemoteRepo({ChefSrc? src}) : chefSrc = src ?? getIt<ChefSrc>();

  @override
  TaskEither<Failure, bool> addFavouriteChef(String chefId) =>
      TaskEither.tryCatch(
        () => chefSrc.addFavouriteChef(chefId),
        (error, stackTrace) => Failure.fromException(error as CException),
      );

  @override
  TaskEither<Failure, ChefWorkStatus> getChefWorkStatus(String chefId) =>
      TaskEither.tryCatch(
        () => chefSrc.getChefWorkStatus(chefId),
        (error, stackTrace) => Failure.fromException(error as CException),
      );

  @override
  TaskEither<Failure, PaginatedData<Chef>> getChefs({
    required bool isPreOrder,
    required double latitude,
    required double longitude,
    required ChefWorkStatus? workStatus,
    required Pagination pagination,
  }) =>
      TaskEither.tryCatch(
        () => chefSrc.getChefs(
            isPreOrder: isPreOrder,
            latitude: latitude,
            longitude: longitude,
            workStatus: workStatus,
            pagination: pagination),
        (error, stackTrace) => Failure.fromException(error as CException),
      );

  @override
  TaskEither<Failure, PaginatedData<Chef>> getFavouriteChefs(
          Pagination pagination) =>
      TaskEither.tryCatch(
        () => chefSrc.getFavouriteChefs(pagination),
        (error, stackTrace) => Failure.fromException(error as CException),
      );

  @override
  TaskEither<Failure, bool> isFavouriteChef(String chefId) =>
      TaskEither.tryCatch(
        () => chefSrc.isFavouriteChef(chefId),
        (error, stackTrace) => Failure.fromException(error as CException),
      );

  @override
  TaskEither<Failure, bool> removeFavouriteChef(String chefId) =>
      TaskEither.tryCatch(
        () => chefSrc.removeFavouriteChef(chefId),
        (error, stackTrace) => Failure.fromException(error as CException),
      );
}
