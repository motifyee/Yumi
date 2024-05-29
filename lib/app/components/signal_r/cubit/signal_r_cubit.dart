import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/app/core/setup/signalr.dart';
import 'package:yumi/domain/signal_r/entity/signal_r.dart';

part 'signal_r_cubit.freezed.dart';
part 'signal_r_cubit.g.dart';

@freezed
class SignalRState with _$SignalRState {
  const factory SignalRState({
    required List<SignalRM> signals,
  }) = _SignalRState;

  factory SignalRState.initial() {
    return SignalRState(signals: []);
  }

  const SignalRState._();

  bool isSignalTriggered({required List<Signals> signal, bool? isPreOrder}) =>
      signals.any((e) =>
          signal.any((c) => c == e.type) &&
          (isPreOrder == null ? false : e.message[0]['is_Preorder'] ?? false));

  factory SignalRState.fromJson(Map<String, dynamic> json) =>
      _$SignalRStateFromJson(json);
}

class SignalRCubit extends Cubit<SignalRState> {
  SignalRCubit() : super(SignalRState.initial());

  addSignals({required SignalRM signal}) {
    emit(state.copyWith(signals: [...state.signals, signal]));
  }

  removeSignals({required List<Signals> signal}) {
    emit(state.copyWith(
        signals: state.signals
            .where((e) => !signal.any((c) => c == e.type))
            .toList()));
  }
}
