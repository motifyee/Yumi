import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/profile/data/repos/profile_repo.dart';

class LoadReviews extends UseCase<List<Review>, NoParams> {
  final ProfileRepo repo;

  LoadReviews({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, List<Review>>> call(params) => repo.getReviews().run();
}
