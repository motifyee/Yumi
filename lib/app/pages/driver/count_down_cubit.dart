import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/util/util.dart';

part 'count_down_cubit.freezed.dart';

@freezed
abstract class CountDownState with _$CountDownState {
  const factory CountDownState({
    Unique? unique,
    int? countDown,
    @Default('') String value,
  }) = _Initial;

  factory CountDownState.initial() => const CountDownState();

  const CountDownState._();
}

class CountDownCubit extends Cubit<CountDownState> {
  CountDownCubit() : super(CountDownState.initial());

  void init() async {}

  void finish() async {}

  Unique? _unique;
  void startCountDown([int countDown = 60]) {
    final lUnique = unique();
    _unique = lUnique;

    emit(state.copyWith(countDown: countDown));

    void recur() => Future.delayed(const Duration(seconds: 1), () {
          if (state.countDown == null) return; // has been stopped
          if (lUnique != _unique) return; // has been restarted

          if ((state.countDown ?? 0) <= 0) {
            return emit(state.copyWith(countDown: null));
          }

          emit(state.copyWith(countDown: state.countDown! - 1));

          recur();
        });

    recur();
  }

  void stopCountDown() {
    _unique = unique();
    emit(state.copyWith(countDown: null));
  }

  void setValue(String value) {
    emit(state.copyWith(value: value));
  }
}
