import 'package:yumi/domain/calories/entity/calorie.dart';
import 'package:yumi/statics/paginatedData.dart';
import 'package:yumi/statics/pagination.dart';

abstract class CaloriesSource {
  Future<PaginatedData<Calorie>> loadCalories({required Pagination pagination});
}
