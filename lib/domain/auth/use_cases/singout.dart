import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/auth/data/repos/auth_repo.dart';

class Logout extends UseCase<bool, NoParams> {
  final AuthRepo repo;

  Logout({AuthRepo? repo}) : repo = repo ?? getIt<AuthRepo>();

  @override
  Future<Either<Failure, bool>> call(NoParams params) => repo.logout().run();
}
