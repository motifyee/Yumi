import 'package:fpdart/fpdart.dart';
import 'package:yumi/app/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';
import 'package:yumi/domain/profile/data/sources/profile_source.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/domain/profile/entities/review.dart';

class ProfileRemoteRepo implements ProfileRepo {
  final ProfileSrc profileSrc;

  ProfileRemoteRepo({ProfileSrc? profileSrc})
      : profileSrc = profileSrc ?? getIt<ProfileSrc>();

  @override
  TaskEither<Failure, Profile> loadProfile(String id) => TaskEither.tryCatch(
        () => profileSrc.loadProfile(id),
        (error, stackTrace) => ApiFailure(error, stackTrace),
      );

  @override
  TaskEither<Failure, String> updateProfile(Profile profile) =>
      TaskEither.tryCatch(
        () => profileSrc.updateProfile(profile),
        (error, stackTrace) => ApiFailure(error, stackTrace),
      );

  @override
  TaskEither<Failure, String> deleteProfile() => TaskEither.tryCatch(
        () => profileSrc.deleteProfile(),
        (error, stackTrace) => ApiFailure(error, stackTrace),
      );

  @override
  TaskEither<Failure, String> getOTP() => TaskEither.tryCatch(
        () => profileSrc.getOTP(),
        (error, stackTrace) => ApiFailure(error, stackTrace),
      );

  @override
  TaskEither<Failure, String> verifyOTP(String otp) => TaskEither.tryCatch(
        () => profileSrc.verifyOTP(otp),
        (error, stackTrace) => ApiFailure(error, stackTrace),
      );

  @override
  TaskEither<Failure, List<Review>> getReviews() => TaskEither.tryCatch(
        () => profileSrc.getReviews(),
        (error, stackTrace) => ApiFailure(error, stackTrace),
      );

  @override
  TaskEither<Failure, String> resetPassword(String email) =>
      TaskEither.tryCatch(
        () => profileSrc.resetPassword(email),
        (error, stackTrace) => ApiFailure(error, stackTrace),
      );
}
