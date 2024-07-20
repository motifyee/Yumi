import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/profile/data/repos/profile_repo.dart';

class GetMobileOTP extends UseCase<String, NoParams> {
  final ProfileRepo repo;

  GetMobileOTP({ProfileRepo? repo}) : repo = repo ?? getIt<ProfileRepo>();

  @override
  Future<Either<Failure, String>> call(params) => repo.getMobileOTP().run();
}
