import 'package:common_code/common_code.dart';
import 'package:yumi/domain/calories/entity/calorie.dart';

abstract class CaloriesSource {
  Future<PaginatedData<Calorie>> loadCalories({required Pagination pagination});
}
