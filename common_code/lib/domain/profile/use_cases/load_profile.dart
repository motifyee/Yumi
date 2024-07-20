import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';

import 'package:common_code/domain/profile/data/repos/profile_repo.dart';

class LoadProfile extends UseCase<Profile, LoadProfileParam> {
  final ProfileRepo repo;

  LoadProfile({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, Profile>> call(params) =>
      repo.loadProfile(params.id, params.withEmail).run();
}

class LoadProfileParam extends Params {
  final String id;
  final String withEmail;

  LoadProfileParam(this.id, this.withEmail);

  @override
  List<Object?> get props => [id, withEmail];
}
