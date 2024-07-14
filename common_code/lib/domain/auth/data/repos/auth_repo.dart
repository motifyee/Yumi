import 'package:common_code/common_code.dart';
import 'package:common_code/domain/auth/entities/signup_data.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepo {
  TaskEither<Failure, User> loginWithEmail(LoginData loginModel);
  TaskEither<Failure, User> signup(SignupData signupData);
  TaskEither<Failure, bool> logout();
}
