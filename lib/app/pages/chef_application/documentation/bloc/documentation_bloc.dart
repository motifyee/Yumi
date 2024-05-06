import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/domain/profile/entities/profile.dart';

part 'documentation_events.dart';
part 'documentation_state.dart';

class DocsBloc extends Bloc<DocsEvents, DocsState> {
  DocsBloc() : super(const DocsState()) {
    on<DocsInitEvent>((event, emit) {
      emit(state.copyWith(status: Status.loading));
    });
    on<DocsInitSuccessEvent>((event, emit) => emit(state.copyWith(
          profile: event.profile,
          // hygiene: event.profile.hygienePhoto,
          // risk: event.profile.riskPhoto,
          // registeration: event.profile.regiserationPhoto,
          // passport: event.profile.passportPhoto,
          // nid: event.profile.nidPhoto,
          status: Status.initSuccess,
        )));
    on<DocsInitFailedEvent>(
        (event, emit) => emit(state.copyWith(status: Status.initError)));

    on<UploadCompleteEvent>((event, emit) {
      emit(state.copyWith(status: Status.success));
    });

// Hygiene
    on<UploadHygieneEvent>((event, emit) => emit(state.copyWith(
        profile: state.profile.copyWith(hygienePhoto: event.data),
        hygieneStatus: Status.loading)));
    on<UploadHygieneSuccessEvent>(
        (event, emit) => emit(state.copyWith(hygieneStatus: Status.success)));
    on<UploadHygieneErrorEvent>(
        (event, emit) => emit(state.copyWith(hygieneStatus: Status.error)));

// Registeration
    on<UploadRegisterationEvent>((event, emit) => emit(state.copyWith(
        profile: state.profile.copyWith(registerationPhoto: event.data),
        registerationStatus: Status.loading)));
    on<UploadRegisterationSuccessEvent>((event, emit) =>
        emit(state.copyWith(registerationStatus: Status.success)));
    on<UploadRegisterationErrorEvent>((event, emit) =>
        emit(state.copyWith(registerationStatus: Status.error)));

// Risk
    on<UploadRiskEvent>((event, emit) => emit(state.copyWith(
        profile: state.profile.copyWith(riskPhoto: event.data),
        riskStatus: Status.loading)));
    on<UploadRiskSuccessEvent>(
        (event, emit) => emit(state.copyWith(riskStatus: Status.success)));
    on<UploadRiskErrorEvent>(
        (event, emit) => emit(state.copyWith(riskStatus: Status.error)));

// ID
    on<UploadIDEvent>((event, emit) => emit(state.copyWith(
        profile: state.profile.copyWith(nidPhoto: event.data),
        idStatus: Status.loading)));
    on<UploadIDSuccessEvent>(
        (event, emit) => emit(state.copyWith(idStatus: Status.success)));
    on<UploadIDErrorEvent>(
        (event, emit) => emit(state.copyWith(idStatus: Status.error)));
  }
}
