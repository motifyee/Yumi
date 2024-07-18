import 'dart:convert';

import 'package:common_code/common_code.dart';
import 'package:dio/dio.dart';
import 'package:yumi/domain/ingredients/data/sources/ingredients_src.dart';
import 'package:yumi/domain/ingredients/entities/ingredient.dart';

class IngredientsRemoteSrc implements IngredientsSrc {
  @override
  Future<List<Ingredient>> getIngredients() async {
    try {
      final res = await APIClient()
          .get(EndPoints.getApiKeyString(apiKey: EndPoints.ingredient));

      return jsonDecode(res.toString());
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }
}
