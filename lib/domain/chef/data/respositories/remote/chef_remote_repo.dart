import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/domain/chef/data/respositories/chef_repo.dart';
import 'package:yumi/domain/chef/data/sources/chef_src.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/statics/pagination.dart';

class ChefRemoteRepo implements ChefRepo {
  final ChefSrc chefSrc;

  ChefRemoteRepo({ChefSrc? chefSrc}) : chefSrc = chefSrc ?? getIt<ChefSrc>();

  @override
  TaskEither<Failure, bool> addFavouriteChef(String chefId) =>
      TaskEither.tryCatch(
        () => chefSrc.addFavouriteChef(chefId),
        (error, stackTrace) => FailureX.fromException(error, stackTrace),
      );

  @override
  TaskEither<Failure, ChefWorkStatus> getChefWorkStatus(String chefId) =>
      TaskEither.tryCatch(
        () => chefSrc.getChefWorkStatus(chefId),
        (error, stackTrace) => FailureX.fromException(error, stackTrace),
      );

  @override
  TaskEither<Failure, List<Chef>> getChefs({
    required bool isPreOrder,
    required double latitude,
    required double longitude,
    required ChefWorkStatus status,
    required Pagination pagination,
  }) =>
      TaskEither.tryCatch(
        () => chefSrc.getChefs(
            isPreOrder: isPreOrder,
            latitude: latitude,
            longitude: longitude,
            status: status,
            pagination: pagination),
        (error, stackTrace) => FailureX.fromException(error, stackTrace),
      );

  @override
  TaskEither<Failure, List<Chef>> getFavouriteChefs(Pagination pagination) =>
      TaskEither.tryCatch(
        () => chefSrc.getFavouriteChefs(pagination),
        (error, stackTrace) => FailureX.fromException(error, stackTrace),
      );

  @override
  TaskEither<Failure, bool> isFavouriteChef(String chefId) =>
      TaskEither.tryCatch(
        () => chefSrc.isFavouriteChef(chefId),
        (error, stackTrace) => FailureX.fromException(error, stackTrace),
      );

  @override
  TaskEither<Failure, bool> removeFavouriteChef(String chefId) =>
      TaskEither.tryCatch(
        () => chefSrc.removeFavouriteChef(chefId),
        (error, stackTrace) => FailureX.fromException(error, stackTrace),
      );
}
