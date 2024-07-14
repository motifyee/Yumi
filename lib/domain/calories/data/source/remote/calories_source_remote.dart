import 'package:yumi/domain/calories/data/source/calories_source.dart';
import 'package:yumi/domain/calories/entity/calorie.dart';
import 'package:yumi/extensions/unique_list_extension.dart';
import 'package:common_code/common_code.dart';

import 'package:common_code/domain/entities/pagination.dart';

class CaloriesRemoteSource implements CaloriesSource {
  @override
  Future<PaginatedData<Calorie>> loadCalories({
    required Pagination pagination,
  }) async {
    final res = await APIClient().get(
        EndPoints.getApiKeyString(apiKey: EndPoints.mealCalories),
        queryParameters: pagination.toJson());

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
