import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/profile/data/repos/profile_repo.dart';

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
