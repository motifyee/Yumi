import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/calories/entity/calorie.dart';

abstract class CaloriesSource {
  Future<PaginatedData<Calorie>> loadCalories({required Pagination pagination});
}
