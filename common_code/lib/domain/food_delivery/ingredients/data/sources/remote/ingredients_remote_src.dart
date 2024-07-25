import 'dart:convert';

import 'package:common_code/common_code.dart';
import 'package:dio/dio.dart';
import 'package:common_code/domain/food_delivery/ingredients/data/sources/ingredients_src.dart';
import 'package:common_code/domain/food_delivery/ingredients/entities/ingredient.dart';

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