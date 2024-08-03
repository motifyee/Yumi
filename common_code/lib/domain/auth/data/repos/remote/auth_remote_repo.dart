import 'package:common_code/common_code.dart';
import 'package:common_code/domain/auth/entities/signup_data.dart';
import 'package:fpdart/fpdart.dart';

class AuthRemoteRepo implements AuthRepo {
  final AuthSrc authSrc;

  AuthRemoteRepo({AuthSrc? src}) : authSrc = src ?? getIt<AuthSrc>();

  @override
  TaskEither<Failure, User> loginWithEmail(LoginData loginModel) {
    return TaskEither.tryCatch(
      () => authSrc.loginWithEmail(loginModel),
      (error, stackTrace) => Failure.fromException(error),
    );
  }

  @override
  TaskEither<Failure, bool> logout() {
    return TaskEither.tryCatch(
      () => authSrc.logout(),
      (error, stackTrace) => Failure.fromException(error),
    );
  }

  @override
  TaskEither<Failure, User> signup(SignupData signupData) {
    return TaskEither.tryCatch(
      () => authSrc.signup(signupData),
      (error, stackTrace) => Failure.fromException(error),
    );
  }
}
