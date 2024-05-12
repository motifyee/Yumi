import 'package:fpdart/fpdart.dart';
import 'package:yumi/app/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';

class VerifyResetPasswordOTP
    extends UseCase<String, VerifyResetPasswordOTPParams> {
  final ProfileRepo repo;

  VerifyResetPasswordOTP({ProfileRepo? repo})
      : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, String>> call(params) => repo
      .verifyResetPasswordOTP(params.email, params.otp, params.password)
      .run();
}

class VerifyResetPasswordOTPParams extends Params {
  final String otp;
  final String email;
  final String password;

  VerifyResetPasswordOTPParams(this.email, this.otp, this.password);

  @override
  List<Object?> get props => [otp];
}
