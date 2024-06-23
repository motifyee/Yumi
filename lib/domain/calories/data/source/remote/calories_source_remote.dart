import 'package:yumi/domain/calories/data/source/calories_source.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/extensions/unique_list_extension.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/pager.dart';

class CaloriesSourceRemote implements CaloriesSource {
  @override
  Future<Pager<Calories>> loadCalories({required Pager<Calories> pager}) async {
    final res = await DioClient.simpleDio().get(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.mealCalories),
        queryParameters: pager.toJson());

    List<Calories> calories = res.data['data']
        .map<Calories>((json) => Calories.fromJson(json))
        .toList();

    return pager.copyWith(
      data: <Calories>[...(pager.data as List<Calories>), ...calories]
          .unique((e) => e.id),
      isLoading: false,
      pageNumber: res.data['pagination']['page'],
      lastPage: res.data['pagination']['pages'],
    ) as Pager<Calories>;
  }
}
