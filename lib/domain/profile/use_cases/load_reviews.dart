import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';
import 'package:yumi/domain/profile/entities/review.dart';

class LoadReviews extends UseCase<List<Review>, NoParams> {
  final ProfileRepo repo;

  LoadReviews({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, List<Review>>> call(params) => repo.getReviews().run();
}
