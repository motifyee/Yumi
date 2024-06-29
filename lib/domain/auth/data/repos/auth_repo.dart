import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/auth/entities/login_data.dart';
import 'package:yumi/app/pages/auth/registeration/pages/signup_screen/entity/signup_data.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/user/entity/user.dart';

abstract class AuthRepo {
  TaskEither<Failure, User> loginWithEmail(LoginData loginModel);
  TaskEither<Failure, User> signup(SignupData signupData);
  TaskEither<Failure, bool> logout();
}
