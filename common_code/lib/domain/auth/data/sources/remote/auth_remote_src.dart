import 'dart:convert';

import 'package:common_code/common_code.dart';
import 'package:common_code/domain/auth/entities/signup_data.dart';
import 'package:dio/dio.dart';

class AuthRemoteSrc implements AuthSrc {
  @override
  Future<User> loginWithEmail(LoginData loginModel) async {
    Response res;
    try {
      res = await APIClient()
          .post(Endpoints().login, data: jsonEncode(loginModel.toJson()));
    } catch (e) {
      throw e.exceptionFromDio;
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

      res = await APIClient().post(
        Endpoints().signup,
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
