import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/calories/entity/calorie.dart';
import 'package:yumi/statics/paginatedData.dart';
import 'package:yumi/statics/pagination.dart';

abstract class CaloriesRepo {
  TaskEither<Failure, PaginatedData<Calorie>> loadCalories({
    required Pagination pagination,
  });
}
