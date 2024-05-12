import 'package:fpdart/fpdart.dart';
import 'package:yumi/app/core/setup/inject.dart';
import 'package:yumi/core/exceptions.dart';
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
        (error, stackTrace) => switch (error) {
          ServerException() => ServerFailure(error, stackTrace),
          _ => GenericFailure(error, stackTrace),
        } as Failure,
      );

  @override
  TaskEither<Failure, Profile> updateProfile(Profile profile) =>
      TaskEither.tryCatch(
        () async {
          await profileSrc.updateProfile(profile);
          return profile;
        },
        (error, stackTrace) => ServerFailure(error, stackTrace),
      );

  @override
  TaskEither<Failure, String> deleteProfile() => TaskEither.tryCatch(
        () => profileSrc.deleteProfile(),
        (error, stackTrace) => ServerFailure(error, stackTrace),
      );

  @override
  TaskEither<Failure, String> addMobile() => TaskEither.tryCatch(
        () => profileSrc.addMobile(),
        (error, stackTrace) => ServerFailure(error, stackTrace),
      );

  @override
  TaskEither<Failure, String> verifyAddMobileOTP(String otp) =>
      TaskEither.tryCatch(
        () => profileSrc.verifyAddMobileOTP(otp),
        (error, stackTrace) => ServerFailure(error, stackTrace),
      );

  @override
  TaskEither<Failure, List<Review>> getReviews() => TaskEither.tryCatch(
        () => profileSrc.getReviews(),
        (error, stackTrace) => ServerFailure(error, stackTrace),
      );

  @override
  TaskEither<Failure, String> resetPassword(String email) =>
      TaskEither.tryCatch(
        () => profileSrc.resetPassword(email),
        (error, stackTrace) => ServerFailure(error, stackTrace),
      );

  @override
  TaskEither<Failure, String> verifyResetPasswordOTP(
          String email, String otp, String password) =>
      TaskEither.tryCatch(
        () => profileSrc.verifyResetPasswordOTP(email, otp, password),
        (error, stackTrace) => ServerFailure(error, stackTrace),
      );
}
