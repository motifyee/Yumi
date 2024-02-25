import 'package:flutter/cupertino.dart';
import 'package:yumi/model/signup_model.dart';
import 'package:yumi/statics/api_statics.dart';

class SignUpService {
  static Future<dynamic> signUp(
      {required SignUpModel signup, required BuildContext context}) async {
    return await DioClient.simpleDio(context).post(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.signup),
        data: signup.toJson());
  }
}
