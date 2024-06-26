import 'package:fpdart/src/task_either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/calories/data/repo/calories_repo.dart';
import 'package:yumi/domain/calories/data/source/calories_source.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/statics/paginatedData.dart';

class CaloriesRepoRemote implements CaloriesRepo {
  final CaloriesSource caloriesSource;

  CaloriesRepoRemote({CaloriesSource? caloriesSource})
      : caloriesSource = caloriesSource ?? getIt<CaloriesSource>();

  @override
  TaskEither<Failure, PaginatedData<Calories>> loadCalories(
          {required PaginatedData<Calories> pagination}) =>
      TaskEither.tryCatch(
          () => caloriesSource.loadCalories(pagination: pagination),
          (error, stackTrace) => ServerFailure(error, stackTrace));
}
