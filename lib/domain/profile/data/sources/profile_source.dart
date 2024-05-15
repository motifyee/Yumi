import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/domain/profile/entities/review.dart';

abstract class ProfileSrc {
  Future<Profile> loadProfile(String id);
  Future<String> updateProfile(Profile profile);
  Future<String> deleteProfile();
  Future<String> addMobile();
  Future<String> verifyAddMobileOTP(String otp);
  Future<List<Review>> getReviews();
  Future<String> resetPassword(String email);
  Future<String> verifyResetPasswordOTP(
    String email,
    String otp,
    String password,
  );
}
