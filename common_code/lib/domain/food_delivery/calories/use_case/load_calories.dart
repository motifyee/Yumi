import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/calories/data/repo/calories_repo.dart';

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
