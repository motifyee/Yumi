import 'package:fpdart/fpdart.dart';
import 'package:common_code/core/failures.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/domain/profile/entities/review.dart';

abstract class ProfileRepo {
  TaskEither<Failure, Profile> loadProfile(String id);
  TaskEither<Failure, Profile> updateProfile(Profile profile);
  TaskEither<Failure, String> deleteProfile();
  TaskEither<Failure, String> getMobileOTP();
  TaskEither<Failure, String> verifyAddMobileOTP(String otp);
  TaskEither<Failure, List<Review>> getReviews();
  TaskEither<Failure, String> resetPasswordByEmail(String email);
  TaskEither<Failure, String> resetPasswordByMobile(String mobile);
  TaskEither<Failure, String> verifyResetPasswordByEmailOTP(
    String email,
    String otp,
    String password,
  );
  TaskEither<Failure, String> verifyResetPasswordByMobileOTP(
    String mobile,
    String otp,
    String password,
  );
  TaskEither<Failure, String> verifyEmail(String email);
}
