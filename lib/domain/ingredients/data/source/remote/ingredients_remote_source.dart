import 'package:common_code/common_code.dart';
import 'package:dio/dio.dart';
import 'package:yumi/domain/ingredients/data/source/ingredients_source.dart';

class IngredientsRemoteSource extends IngredientsSource {
  @override
  Future<List<Ingredient>> getAllIngredients() async {
    Response res;
    try {
      res = await APIClient().get(Endpoints().ingredient);
    } catch (e) {
      throw ServerException(e as DioException);
    }

    List<Ingredient> ingredients = res.data['data']
        .map<Ingredient>((json) => Ingredient.fromJson(json))
        .toList();

    return ingredients;
  }
}
