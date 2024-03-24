import 'package:flutter/cupertino.dart';
import 'package:yumi/features/registeration/model/registeration.dart';
import 'package:yumi/statics/api_statics.dart';

class SignUpService {
  static Future<dynamic> signUp(
      {required RegisterationForm signup,
      required BuildContext context}) async {
    return await DioClient.simpleDio(context).post(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.signup),
        data: signup.toJson());
  }
}