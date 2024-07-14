import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';
import 'package:yumi/domain/profile/entities/profile.dart';

class UploadProfilePhotos extends UseCase<Profile, UploadProfilePhotosParam> {
  final ProfileRepo repo;

  UploadProfilePhotos({ProfileRepo? repo})
      : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, Profile>> call(params) {
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

class UploadProfilePhotosParam extends Params {
  final List<String?> photos;
  final Profile profile;

  UploadProfilePhotosParam(this.profile, this.photos);

  @override
  List<Object?> get props => [photos];
}
