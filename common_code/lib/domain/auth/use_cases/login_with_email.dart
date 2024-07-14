import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';

class LoginWithEmail extends UseCase<User, LoginWithEmailParams> {
  final AuthRepo repo;

  LoginWithEmail({AuthRepo? repo}) : repo = repo ?? getIt<AuthRepo>();

  @override
  Future<Either<Failure, User>> call(LoginWithEmailParams params) =>
      repo.loginWithEmail(params.loginModel).run();
}

class LoginWithEmailParams extends Params {
  final LoginData loginModel;

  LoginWithEmailParams(this.loginModel);

  @override
  List<Object?> get props => [loginModel];
}
