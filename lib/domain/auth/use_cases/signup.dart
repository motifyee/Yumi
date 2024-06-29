import 'package:fpdart/fpdart.dart';
import 'package:yumi/app/pages/auth/registeration/pages/signup_screen/entity/signup_data.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/auth/data/repos/auth_repo.dart';
import 'package:yumi/domain/user/entity/user.dart';

class Signup extends UseCase<User, SignupParams> {
  final AuthRepo repo;

  Signup({AuthRepo? repo}) : repo = repo ?? getIt<AuthRepo>();

  @override
  Future<Either<Failure, User>> call(SignupParams params) =>
      repo.signup(params.signupData).run();
}

class SignupParams extends Params {
  final SignupData signupData;

  SignupParams(this.signupData);

  @override
  List<Object?> get props => [signupData];
}
