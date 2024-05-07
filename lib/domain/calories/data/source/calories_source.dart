import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/statics/pagination_helper.dart';

abstract class CaloriesSource {
  Future<PaginationHelper<Calories>> loadCalories(
      {required PaginationHelper<Calories> paginationHelper});
}
