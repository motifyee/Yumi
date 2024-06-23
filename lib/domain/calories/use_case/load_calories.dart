import 'package:fpdart/src/either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/calories/data/repo/calories_repo.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/statics/pagination.dart';

class LoadCalories extends UseCase<Pagination<Calories>, LoadCaloriesParams> {
  final CaloriesRepo repo;

  LoadCalories({CaloriesRepo? repo}) : repo = repo ?? getIt<CaloriesRepo>();

  @override
  Future<Either<Failure, Pagination<Calories>>> call(
          LoadCaloriesParams params) =>
      repo.loadCalories(pagination: params.pagination).run();
}

class LoadCaloriesParams extends Params {
  final Pagination<Calories> pagination;

  LoadCaloriesParams({required this.pagination});

  @override
  List<Object?> get props => [pagination];
}
