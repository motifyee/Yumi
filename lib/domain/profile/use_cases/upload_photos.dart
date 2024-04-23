import 'package:fpdart/fpdart.dart';
import 'package:yumi/app/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';
import 'package:yumi/domain/profile/entities/profile.dart';

class UploadProfilePhotos extends UseCase<String, UploadProfilePhotoParam> {
  final ProfileRepo repo;

  UploadProfilePhotos({ProfileRepo? repo})
      : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, String>> call(params) {
    final photos = [
      ...params.photos,
      for (var i = params.photos.length; i < 5; i++) null
    ];

    var profile = params.profile.copyWith(
      eventPhoto0: photos[0],
      eventPhoto1: photos[1],
      eventPhoto2: photos[2],
      eventPhoto3: photos[3],
      eventPhoto4: photos[4],
    );

    return repo.updateProfile(profile).run();
  }
}

class UploadProfilePhotoParam extends Params {
  final List<String?> photos;
  final Profile profile;

  UploadProfilePhotoParam(this.profile, this.photos);

  @override
  List<Object?> get props => [photos];
}
