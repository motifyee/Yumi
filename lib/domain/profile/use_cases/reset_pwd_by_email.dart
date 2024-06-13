import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';

class ResetPasswordByEmail extends UseCase<String, ResetPasswordByEmailParams> {
  final ProfileRepo repo;

  ResetPasswordByEmail({ProfileRepo? repo})
      : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, String>> call(params) =>
      repo.resetPasswordByEmail(params.email).run();
}

class ResetPasswordByEmailParams extends Params {
  final String email;
  ResetPasswordByEmailParams(this.email);

  @override
  List<Object?> get props => [email];
}
