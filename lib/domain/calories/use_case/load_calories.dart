import 'package:fpdart/src/either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/calories/data/repo/calories_repo.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/statics/pager.dart';

class LoadCalories extends UseCase<Pager<Calories>, LoadCaloriesParams> {
  final CaloriesRepo repo;

  LoadCalories({CaloriesRepo? repo}) : repo = repo ?? getIt<CaloriesRepo>();

  @override
  Future<Either<Failure, Pager<Calories>>> call(LoadCaloriesParams params) =>
      repo.loadCalories(pager: params.pager).run();
}

class LoadCaloriesParams extends Params {
  final Pager<Calories> pager;

  LoadCaloriesParams({required this.pager});

  @override
  List<Object?> get props => [pager];
}
