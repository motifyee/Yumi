import 'package:common_code/common_code.dart';
import 'package:dio/dio.dart';
import 'package:yumi/domain/ingredients/data/source/ingredients_source.dart';
import 'package:yumi/domain/ingredients/entity/ingredients.dart';

class IngredientsRemoteSource extends IngredientsSource {
  @override
  Future<List<Ingredients>> getAllIngredients() async {
    Response res;
    try {
      res = await APIClient().get(EndPoints.ingredient);
    } catch (e) {
      throw ServerException(e as DioException);
    }

    List<Ingredients> ingredients = res.data['data'].map<Ingredients>((json) => Ingredients.fromJson(json)).toList();

    return ingredients;
  }
}
