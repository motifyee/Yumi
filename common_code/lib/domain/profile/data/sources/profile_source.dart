import 'package:common_code/domain/profile/entities/profile.dart';
import 'package:common_code/domain/profile/entities/review.dart';

abstract class ProfileSrc {
  Future<Profile> loadProfile(String id, String withEmail);
  Future<String> updateProfile(Profile profile);
  Future<String> deleteProfile();
  Future<String> getMobileOTP();
  Future<String> verifyAddMobileOTP(String otp);
  Future<List<Review>> getReviews();
  Future<String> resetPasswordByEmail(String email);
  Future<String> resetPasswordByMobile(String mobile);
  Future<String> verifyResetPasswordByEmailOTP(
    String email,
    String otp,
    String password,
  );
  Future<String> verifyResetPasswordByMobileOTP(
    String mobile,
    String otp,
    String password,
  );
  Future<String> verifyEmail(String email);
  Future<String> updateStatus(int status);
}
