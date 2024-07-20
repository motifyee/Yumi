import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/profile/data/repos/profile_repo.dart';

class UpdateStatus extends UseCase<String, UpdateStatusParam> {
  final ProfileRepo repo;

  UpdateStatus({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, String>> call(params) =>
      repo.updateStatus(params.status).run();
}

class UpdateStatusParam extends Params {
  final int status;

  UpdateStatusParam(this.status);

  @override
  List<Object?> get props => [status];
}
