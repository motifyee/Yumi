import 'package:common_code/common_code.dart';

abstract class CaloriesSource {
  Future<PaginatedData<Calorie>> loadCalories({required Pagination pagination});
}
