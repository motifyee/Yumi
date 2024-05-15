import 'package:flutter/cupertino.dart';
import 'package:yumi/app/pages/auth/register/model/registeration.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/code_generator.dart';

class SignUpService {
  static Future<dynamic> signUp(
      {required RegisterationForm signup,
      required BuildContext context}) async {
    return await DioClient.simpleDio(context)
        .post(ApiKeys.getApiKeyString(apiKey: ApiKeys.signup),
            data: signup
                .copyWith(
                  code: CodeGenerator.getRandomCode(),
                )
                .toJson());
  }
}
