import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/statics/pagination.dart';

abstract class CaloriesSource {
  Future<Pagination<Calories>> loadCalories(
      {required Pagination<Calories> pagination});
}
