import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/global.dart';

class CountDownStarted extends UseCase<bool, CountDownStartedParam> {
  CountDownStarted();

  @override
  Future<Either<Failure, bool>> call(params) async {
    await G.prefs.then((prefs) {
      prefs.setString(params.storageKey, params.value);
      prefs.setInt(params.timeStorageKey, params.initialTime);
    });
    return right(true);
  }
}

class CountDownStartedParam extends Params {
  final String value;
  final String storageKey;
  final String timeStorageKey;
  final int initialTime;

  CountDownStartedParam(
    this.storageKey,
    this.timeStorageKey,
    this.value,
    this.initialTime,
  );

  @override
  List<Object?> get props => [value, storageKey, timeStorageKey];
}
