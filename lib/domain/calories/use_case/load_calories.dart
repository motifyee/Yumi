import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/calories/data/repo/calories_repo.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/statics/paginatedData.dart';

class LoadCalories
    extends UseCase<PaginatedData<Calories>, LoadCaloriesParams> {
  final CaloriesRepo repo;

  LoadCalories({CaloriesRepo? repo}) : repo = repo ?? getIt<CaloriesRepo>();

  @override
  Future<Either<Failure, PaginatedData<Calories>>> call(
          LoadCaloriesParams params) =>
      repo.loadCalories(pagination: params.pagination).run();
}

class LoadCaloriesParams extends Params {
  final PaginatedData<Calories> pagination;

  LoadCaloriesParams({required this.pagination});

  @override
  List<Object?> get props => [pagination];
}
