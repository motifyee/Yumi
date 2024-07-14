import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/domain/profile/data/repos/profile_repo.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/global.dart';

class LoadProfile extends UseCase<Profile, LoadProfileParam> {
  final ProfileRepo repo;

  LoadProfile({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, Profile>> call(params) =>
      repo.loadProfile(params.id ?? G().rd<UserCubit>().state.user.id).run();
}

class LoadProfileParam extends Params {
  final String? id;

  LoadProfileParam([this.id]);

  @override
  List<Object?> get props => [id];
}
