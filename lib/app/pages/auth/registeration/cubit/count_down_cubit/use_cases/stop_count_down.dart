import 'package:fpdart/fpdart.dart';
import 'package:common_code/core/use_cases.dart';
import 'package:common_code/core/failures.dart';
import 'package:yumi/global.dart';

class CountDownStopped extends UseCase<bool, CountDownStoppedParam> {
  CountDownStopped();

  @override
  Future<Either<Failure, bool>> call(params) async {
    await G().prefs.then((prefs) {
      prefs.remove(params.storageKey);
      prefs.remove(params.timeStorageKey);
    });
    return right(true);
  }
}

class CountDownStoppedParam extends Params {
  final String storageKey;
  final String timeStorageKey;

  CountDownStoppedParam(
    this.storageKey,
    this.timeStorageKey,
  );

  @override
  List<Object?> get props => [storageKey, timeStorageKey];
}
