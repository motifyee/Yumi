import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/profile/data/repos/profile_repo.dart';

class VerifyResetPasswordByEmailOTP
    extends UseCase<String, VerifyResetPasswordOTPByEmailParams> {
  final ProfileRepo repo;

  VerifyResetPasswordByEmailOTP({ProfileRepo? repo})
      : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, String>> call(params) => repo
      .verifyResetPasswordByEmailOTP(params.email, params.otp, params.password)
      .run();
}

class VerifyResetPasswordOTPByEmailParams extends Params {
  final String otp;
  final String email;
  final String password;

  VerifyResetPasswordOTPByEmailParams(this.email, this.otp, this.password);

  @override
  List<Object?> get props => [otp];
}
