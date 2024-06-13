import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';
import 'package:yumi/domain/profile/entities/profile.dart';

class UpdateProfile extends UseCase<Profile, UpdateProfileParam> {
  final ProfileRepo repo;

  UpdateProfile({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, Profile>> call(params) => repo
      .updateProfile(
        params.profile,
      )
      .run();
}

class UpdateProfileParam extends Params {
  final Profile profile;

  UpdateProfileParam(this.profile);

  @override
  List<Object?> get props => [profile];
}
