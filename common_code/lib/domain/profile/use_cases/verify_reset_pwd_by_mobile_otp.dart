import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/profile/data/repos/profile_repo.dart';

class VerifyResetPasswordByMobileOTP
    extends UseCase<String, VerifyResetPasswordOTPByMobileParams> {
  final ProfileRepo repo;

  VerifyResetPasswordByMobileOTP({ProfileRepo? repo})
      : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, String>> call(params) => repo
      .verifyResetPasswordByMobileOTP(
          params.mobile, params.otp, params.password)
      .run();
}

class VerifyResetPasswordOTPByMobileParams extends Params {
  final String otp;
  final String mobile;
  final String password;

  VerifyResetPasswordOTPByMobileParams(this.mobile, this.otp, this.password);

  @override
  List<Object?> get props => [otp];
}
