import 'package:yumi/model/signup_model.dart';
import 'package:yumi/statics/api_statics.dart';

Future<dynamic> signUpServeice({required SignUpModel signup}) async {
  return await DioClient.simpleDio().post(
      ApiKeys.getApiKeyString(apiKey: ApiKeys.signup),
      data: signup.toJson());
}
