import 'package:fpdart/fpdart.dart';
import 'package:yumi/app/inject.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/global.dart';

class LoadProfile extends UseCase<Profile, LoadProfileParam> {
  final ProfileRepo repo;

  LoadProfile({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, Profile>> call(params) =>
      repo.loadProfile(params.id ?? G.read<UserBloc>().state.user.id).run();
}

class LoadProfileParam extends Params {
  final String? id;

  LoadProfileParam([this.id]);

  @override
  List<Object?> get props => [id];
}
