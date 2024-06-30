import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/meal/entity/meal.dart';

class UpdateMealForm extends UseCase<Meal, UpdateMealFormParams> {
  @override
  Future<Either<Failure, Meal>> call(UpdateMealFormParams params) async {
    return Right(params.meal);
  }
}

class UpdateMealFormParams extends Params {
  final Meal meal;

  UpdateMealFormParams({required this.meal});

  @override
  List<Object?> get props => [meal];
}
