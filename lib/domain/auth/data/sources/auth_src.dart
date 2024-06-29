import 'package:yumi/domain/auth/entities/login_data.dart';
import 'package:yumi/app/pages/auth/registeration/pages/signup_screen/entity/signup_data.dart';
import 'package:yumi/domain/user/entity/user.dart';

abstract class AuthSrc {
  Future<User> loginWithEmail(LoginData loginModel);
  Future<User> signup(SignupData signupData);
  Future<bool> logout();
}
