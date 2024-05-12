import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/domain/profile/entities/review.dart';

abstract class ProfileRepo {
  TaskEither<Failure, Profile> loadProfile(String id);
  TaskEither<Failure, Profile> updateProfile(Profile profile);
  TaskEither<Failure, String> deleteProfile();
  TaskEither<Failure, String> addMobile();
  TaskEither<Failure, String> verifyAddMobileOTP(String otp);
  TaskEither<Failure, List<Review>> getReviews();
  TaskEither<Failure, String> resetPassword(String email);
  TaskEither<Failure, String> verifyResetPasswordOTP(
    String email,
    String otp,
    String password,
  );
}
