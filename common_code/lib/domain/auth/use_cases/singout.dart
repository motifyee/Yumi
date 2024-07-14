import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';

class Logout extends UseCase<bool, NoParams> {
  final AuthRepo repo;

  Logout({AuthRepo? repo}) : repo = repo ?? getIt<AuthRepo>();

  @override
  Future<Either<Failure, bool>> call(NoParams params) => repo.logout().run();
}
