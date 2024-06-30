import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/auth/entities/login_data.dart';
import 'package:yumi/app/pages/auth/registeration/pages/signup_screen/entity/signup_data.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/domain/auth/data/repos/auth_repo.dart';
import 'package:yumi/domain/auth/data/sources/auth_src.dart';
import 'package:yumi/domain/user/entity/user.dart';

class AuthRemoteRepo implements AuthRepo {
  final AuthSrc authSrc;

  AuthRemoteRepo({AuthSrc? src}) : authSrc = src ?? getIt<AuthSrc>();

  @override
  TaskEither<Failure, User> loginWithEmail(LoginData loginModel) {
    return TaskEither.tryCatch(
      () => authSrc.loginWithEmail(loginModel),
      (error, stackTrace) => FailureX.fromException(error, stackTrace),
    );
  }

  @override
  TaskEither<Failure, bool> logout() {
    return TaskEither.tryCatch(
      () => authSrc.logout(),
      (error, stackTrace) => FailureX.fromException(error, stackTrace),
    );
  }

  @override
  TaskEither<Failure, User> signup(SignupData signupData) {
    return TaskEither.tryCatch(
      () => authSrc.signup(signupData),
      (error, stackTrace) => FailureX.fromException(error, stackTrace),
    );
  }
}
