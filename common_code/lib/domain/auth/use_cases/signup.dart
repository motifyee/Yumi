import 'package:common_code/common_code.dart';
import 'package:common_code/domain/auth/entities/signup_data.dart';
import 'package:fpdart/fpdart.dart';

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
