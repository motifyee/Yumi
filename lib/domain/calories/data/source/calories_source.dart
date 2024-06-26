import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/statics/paginatedData.dart';

abstract class CaloriesSource {
  Future<PaginatedData<Calories>> loadCalories(
      {required PaginatedData<Calories> pagination});
}
