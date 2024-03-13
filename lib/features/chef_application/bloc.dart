import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// =============================================================================
// Events

class ChefFlowEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChefFlowEventStart extends ChefFlowEvent {}

class ChefFlowEventNext extends ChefFlowEvent {
  final int idx;

  ChefFlowEventNext({required this.idx});

  @override
  List<Object?> get props => [idx];
}

class ChefFlowEventSubmit extends ChefFlowEvent {}

// =============================================================================
// State

class ChefFlowState extends Equatable {
  final bool started;
  final int activeIdx;

  const ChefFlowState(this.activeIdx, {this.started = false});

  ChefFlowState copyWith({int? activeIdx, bool? started}) => ChefFlowState(
        activeIdx ?? this.activeIdx,
        started: started ?? this.started,
      );

  @override
  List<Object> get props => [activeIdx, started];
}

// =============================================================================
// Bloc

class ChefFlowBloc extends Bloc<ChefFlowEvent, ChefFlowState> {
  ChefFlowBloc() : super(const ChefFlowState(0, started: true)) {
    on<ChefFlowEventStart>((event, emit) {
      emit(state.copyWith(started: true));
    });

    on<ChefFlowEventNext>((event, emit) {
      if (!state.started || state.activeIdx > event.idx) return;

      emit(state.copyWith(activeIdx: event.idx));
    });

    on<ChefFlowEventSubmit>((event, emit) {
      emit(state.copyWith(started: false));
    });
  }
}
