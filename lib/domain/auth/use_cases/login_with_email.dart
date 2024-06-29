import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/auth/entities/login_data.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/auth/data/repos/auth_repo.dart';
import 'package:yumi/domain/user/entity/user.dart';

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
