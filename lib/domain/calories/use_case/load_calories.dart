import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/calories/data/repo/calories_repo.dart';
import 'package:yumi/domain/calories/entity/calorie.dart';

import 'package:common_code/domain/entities/pagination.dart';

class LoadCalories extends UseCase<PaginatedData<Calorie>, LoadCaloriesParams> {
  final CaloriesRepo repo;

  LoadCalories({CaloriesRepo? repo}) : repo = repo ?? getIt<CaloriesRepo>();

  @override
  Future<Either<Failure, PaginatedData<Calorie>>> call(
    LoadCaloriesParams params,
  ) =>
      repo.loadCalories(pagination: params.pagination).run();
}

class LoadCaloriesParams extends Params {
  final Pagination pagination;

  LoadCaloriesParams({required this.pagination});

  @override
  List<Object?> get props => [pagination];
}
