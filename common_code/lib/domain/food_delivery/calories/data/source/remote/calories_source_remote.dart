import 'package:common_code/domain/food_delivery/calories/data/source/calories_source.dart';
import 'package:common_code/common_code.dart';

class CaloriesRemoteSource implements CaloriesSource {
  @override
  Future<PaginatedData<Calorie>> loadCalories({
    required Pagination pagination,
  }) async {
    final res = await APIClient()
        .get(Endpoints().mealCalories, queryParameters: pagination.toJson());

    List<Calorie> calories = res.data['data']
        .map<Calorie>((json) => Calorie.fromJson(json))
        .toList();

    return PaginatedData<Calorie>(
      data: calories.unique((e) => e.id),
      pageNumber: res.data['pagination']['page'],
      lastPage: res.data['pagination']['pages'],
    );
  }
}
