import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/profile/data/repos/profile_repo.dart';

class DeleteProfilePhoto extends UseCase<Profile, DeleteProfilePhotoParam> {
  final ProfileRepo repo;

  DeleteProfilePhoto({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  // TODO delete by index
  Future<Either<Failure, Profile>> call(params) {
    bool removed = false;
    List<String> photos = params.profile.eventPhotos.where((element) {
      if (removed) return true;
      if (element != params.photo) return true;
      removed = true;
      return false;
    }).toList();

    photos = [...photos, for (var i = photos.length; i < 5; i++) ''];

    final profile = params.profile.copyWith(
      eventPhoto0: photos[0],
      eventPhoto1: photos[1],
      eventPhoto2: photos[2],
      eventPhoto3: photos[3],
      eventPhoto4: photos[4],
    );

    return repo.updateProfile(profile).run();
  }
}

class DeleteProfilePhotoParam extends Params {
  final String photo;
  final Profile profile;

  DeleteProfilePhotoParam(this.profile, this.photo);

  @override
  List<Object?> get props => [photo];
}
