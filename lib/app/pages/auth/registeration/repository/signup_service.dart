import 'package:flutter/cupertino.dart';
import 'package:common_code/domain/auth/entities/signup_data.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/util/code_generator.dart';

class SignUpService {
  static Future<dynamic> signUp(
      {required SignupData signup, required BuildContext context}) async {
    return await APIClient()
        .post(EndPoints.getApiKeyString(apiKey: EndPoints.signup),
            data: signup
                .copyWith(
                  code: CodeGenerator.getRandomCode(),
                )
                .toJson());
  }
}
