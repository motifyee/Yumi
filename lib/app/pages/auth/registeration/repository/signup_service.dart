import 'package:flutter/cupertino.dart';
import 'package:yumi/app/pages/auth/registeration/pages/signup_screen/entity/signup_data.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/code_generator.dart';

class SignUpService {
  static Future<dynamic> signUp({required SignupData signup, required BuildContext context}) async {
    return await DioClient.simpleDio().post(ApiKeys.getApiKeyString(apiKey: ApiKeys.signup),
        data: signup
            .copyWith(
              code: CodeGenerator.getRandomCode(),
            )
            .toJson());
  }
}
