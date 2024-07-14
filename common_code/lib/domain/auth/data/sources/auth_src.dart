import 'package:common_code/common_code.dart';
import 'package:common_code/domain/auth/entities/signup_data.dart';

abstract class AuthSrc {
  Future<User> loginWithEmail(LoginData loginModel);
  Future<User> signup(SignupData signupData);
  Future<bool> logout();
}
