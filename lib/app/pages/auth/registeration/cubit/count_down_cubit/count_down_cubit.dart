import 'package:common_code/common_code.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/global.dart';

part 'count_down_cubit.freezed.dart';

// -----------------------------------------------------------------------------
// CountDownState

@freezed
abstract class CountDownState with _$CountDownState {
  const factory CountDownState({
    Unique? unique,
    int? countDown,
    int? timeout,
    int? initialTime,
    @Default('') String storageKey,
    @Default('') String value,
    void Function(CountDownState)? onTimeout,
    void Function(CountDownState)? onTick,
  }) = _Initial;

  factory CountDownState.initial() => const CountDownState();

  const CountDownState._();

  String get timeStorageKey => '$storageKey-time';

  bool get isRunning => countDown != null;
}

// -----------------------------------------------------------------------------
// CountDownCubit

class CountDownCubit extends Cubit<CountDownState> {
  CountDownCubit() : super(CountDownState.initial());

  Future<void> init({
    String storageKey = 'count-down-key',
    void Function(CountDownState)? onTimeout,
    void Function(CountDownState)? onTick,
  }) async {
    emit(state.copyWith(
      storageKey: storageKey,
      onTimeout: onTimeout,
      onTick: onTick,
    ));

    final prefs = await G().prefs;
    final value = prefs.getString(state.storageKey);
    if (value == null) return;

    final initialTime = prefs.getInt(state.timeStorageKey) ?? 0;

    if ((DateTime.now().millisecondsSinceEpoch - initialTime) >= 1000 * 60) {
      prefs.remove(state.timeStorageKey);
      prefs.remove(state.storageKey);
      return;
    }

    emit(state.copyWith(
      value: value,
      initialTime: initialTime,
    ));

    await start(value: value);
  }

  Unique? _unique;
  Future<void> start({
    required String value,
    int timeout = 60,
  }) async {
    final lUnique = unique();
    _unique = lUnique;

    final now = DateTime.now().millisecondsSinceEpoch;

    final initialTime = state.initialTime ?? now;

    final d = now - initialTime;
    if (d >= 1000 * timeout) return emit(state.copyWith(countDown: null));

    emit(state.copyWith(
      value: value,
      timeout: timeout,
      initialTime: initialTime,
      countDown: timeout - (d / 1000).round(),
    ));

    await G().prefs.then((prefs) {
      prefs.setString(state.storageKey, value);
      prefs.setInt(state.timeStorageKey, initialTime);
    });

    void recur() => Future.delayed(const Duration(seconds: 1), () {
          if (isClosed) return;

          if (state.onTick != null) state.onTick!(state);

          if (state.countDown == null) return; // has been stopped || timed out
          if (lUnique != _unique) return; // has been restarted

          if ((state.countDown ?? 0) <= 0) {
            if (state.onTimeout != null) state.onTimeout!(state);
            return emit(state.copyWith(countDown: null));
          }

          emit(state.copyWith(countDown: state.countDown! - 1));

          recur();
        });

    recur();
  }

  Future<void> restart() async {
    stop();
    await start(value: state.value, timeout: state.timeout ?? 60);
  }

  void stop() async {
    _unique = unique();
    emit(state.copyWith(countDown: null, initialTime: null));

    await G().prefs.then((prefs) {
      prefs.remove(state.storageKey);
      prefs.remove(state.timeStorageKey);
    });
  }

  void setValue(String value) async {
    emit(state.copyWith(value: value));

    if (state.isRunning) {
      await G().prefs.then((prefs) => prefs.setString(state.storageKey, value));
    }
  }
}

// -----------------------------------------------------------------------------
// Util

Future<bool> hasActiveCountDown({
  required String storageKey,
  int timeout = 60,
}) async {
  final prefs = await G().prefs;
  final initialTime = prefs.getInt('$storageKey-time');

  if (initialTime == null) return false;

  final now = DateTime.now().millisecondsSinceEpoch;
  return (now - initialTime) <= 1000 * 60;
}

Future<String?> counterStoredValue({
  required String storageKey,
}) async {
  final prefs = await G().prefs;
  return prefs.getString(storageKey);
}
