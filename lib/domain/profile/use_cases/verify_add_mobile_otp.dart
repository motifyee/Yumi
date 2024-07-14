import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';

class VerifyMobileOTP extends UseCase<String, VerifyOTPParams> {
  final ProfileRepo repo;

  VerifyMobileOTP({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, String>> call(params) =>
      repo.verifyAddMobileOTP(params.otp).run();
}

class VerifyOTPParams extends Params {
  final String otp;

  VerifyOTPParams(this.otp);

  @override
  List<Object?> get props => [otp];
}
