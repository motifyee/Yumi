import 'package:dependencies/dependencies.dart';
import 'package:common_code/core/setup/signalr.dart';
import 'package:yumi/domain/signal_r/entity/signal_r.dart';

part 'signal_r_cubit.freezed.dart';
part 'signal_r_cubit.g.dart';

@freezed
class SignalRState with _$SignalRState {
  const factory SignalRState({
    required List<SignalRM> signals,
  }) = _SignalRState;

  factory SignalRState.initial() {
    return const SignalRState(signals: []);
  }

  const SignalRState._();

  bool hasAnySignalTriggered({
    required List<Signal> watchedSignals,
    bool? isPreOrder,
  }) {
    return signals.any((e) {
      final matchOrderType =
          isPreOrder == null ? true : isPreOrder == e.message[0]['is_Preorder'];

      return matchOrderType && watchedSignals.any((c) => c == e.type);
    });
  }

  factory SignalRState.fromJson(Map<String, dynamic> json) =>
      _$SignalRStateFromJson(json);
}

class SignalRCubit extends Cubit<SignalRState> {
  SignalRCubit() : super(SignalRState.initial());

  addSignals({required SignalRM signal}) {
    emit(state.copyWith(signals: [...state.signals, signal]));
  }

  removeSignals({required List<Signal> signal}) {
    emit(
      state.copyWith(
        signals: state.signals
            .where((e) => !signal.any((c) => c == e.type))
            .toList(),
      ),
    );
  }
}
