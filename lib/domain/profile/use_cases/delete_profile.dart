import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';

class DeleteProfile extends UseCase<String, NoParams> {
  final ProfileRepo repo;

  DeleteProfile({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, String>> call(params) => repo.deleteProfile().run();
}
