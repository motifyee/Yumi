import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/domain/profile/entities/review.dart';

abstract class ProfileSrc {
  Future<Profile> loadProfile(String id);
  Future<String> updateProfile(Profile profile);
  Future<String> deleteProfile();
  Future<String> getOTP();
  Future<String> verifyOTP(String otp);
  Future<List<Review>> getReviews();
  Future<String> resetPassword(String email);
}
