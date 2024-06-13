import 'package:fpdart/src/either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/calories/data/repo/calories_repo.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/statics/pagination_helper.dart';

class LoadCalories
    extends UseCase<PaginationHelper<Calories>, LoadCaloriesParams> {
  final CaloriesRepo repo;

  LoadCalories({CaloriesRepo? repo}) : repo = repo ?? getIt<CaloriesRepo>();

  @override
  Future<Either<Failure, PaginationHelper<Calories>>> call(
          LoadCaloriesParams params) =>
      repo.loadCalories(paginationHelper: params.paginationHelper).run();
}

class LoadCaloriesParams extends Params {
  final PaginationHelper<Calories> paginationHelper;

  LoadCaloriesParams({required this.paginationHelper});

  @override
  List<Object?> get props => [paginationHelper];
}
