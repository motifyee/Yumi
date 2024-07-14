import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';
import 'package:yumi/domain/profile/entities/profile.dart';

class UpdateProfilePhoto extends UseCase<Profile, UpdateProfilePhotoParam> {
  final ProfileRepo repo;

  UpdateProfilePhoto({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, Profile>> call(params) {
    var profile = params.profile.copyWith(
      profileImage: params.photo,
    );

    return repo.updateProfile(profile).run();
  }
}

class UpdateProfilePhotoParam extends Params {
  final String? photo;
  final Profile profile;

  UpdateProfilePhotoParam(this.profile, this.photo);

  @override
  List<Object?> get props => [photo];
}
