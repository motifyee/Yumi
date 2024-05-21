import 'package:fpdart/fpdart.dart';
import 'package:yumi/app/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';

class VerifyEmail extends UseCase<String, VerifyEmailParams> {
  final ProfileRepo repo;

  VerifyEmail({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, String>> call(params) =>
      repo.verifyEmail(params.email).run();
}

class VerifyEmailParams extends Params {
  final String email;

  VerifyEmailParams(this.email);

  @override
  List<Object?> get props => [email];
}
