import 'package:fpdart/fpdart.dart';
import 'package:yumi/app/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';

class ForgotPassword extends UseCase<String, ForgotPasswordParams> {
  final ProfileRepo repo;

  ForgotPassword({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, String>> call(params) =>
      repo.resetPassword(params.email).run();
}

class ForgotPasswordParams extends Params {
  final String email;
  ForgotPasswordParams(this.email);

  @override
  List<Object?> get props => [email];
}
