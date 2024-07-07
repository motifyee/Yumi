import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:yumi/domain/auth/entities/login_data.dart';
import 'package:yumi/app/pages/auth/registeration/pages/signup_screen/entity/signup_data.dart';
import 'package:yumi/core/exceptions.dart';
import 'package:yumi/domain/auth/data/sources/auth_src.dart';
import 'package:yumi/domain/user/entity/user.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/code_generator.dart';

class AuthRemoteSrc implements AuthSrc {
  @override
  Future<User> loginWithEmail(LoginData loginModel) async {
    Response res;
    try {
      res = await DioClient.simpleDio().post(
          ApiKeys.getApiKeyString(apiKey: ApiKeys.login),
          data: jsonEncode(loginModel.toJson()));
    } catch (e) {
      throw ServerException(e as DioException);
    }

    final user = User.fromJson(res.data);

    if (user.accessToken.isNotEmpty) return user;

    if (user.message.isNotEmpty) throw GenericException(user.message);

    throw GenericException('Something went wrong');
  }

  @override
  Future<User> signup(SignupData signupData) async {
    Response res;

    try {
      final signupData0 =
          signupData.copyWith(code: CodeGenerator.getRandomCode()).toJson();

      res = await DioClient.simpleDio().post(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.signup),
        data: signupData0,
      );
    } catch (e) {
      throw ServerException(e as DioException);
    }

    final data = jsonDecode(res.toString());
    if (!data["message"].toString().contains('Created')) {
      throw GenericException(data["message"].toString());
    }

    try {
      var idReg = RegExp(r"Created with id:\s*(.*)");

      var chefId = idReg.firstMatch(data["message"])!.group(1)!;

      return signupData.toUser(chefId, data['token']);
    } catch (e) {
      throw GenericException('Something went wrong');
    }
  }

  @override
  Future<bool> logout() async {
    return true;
  }
}
