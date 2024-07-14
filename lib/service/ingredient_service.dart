import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:common_code/common_code.dart';

class IngredientService {
  static Future<dynamic> getIngredients({required BuildContext context}) async {
    final res = await APIClient()
        .get(EndPoints.getApiKeyString(apiKey: EndPoints.ingredient));
    return jsonDecode(res.toString());
  }
}
