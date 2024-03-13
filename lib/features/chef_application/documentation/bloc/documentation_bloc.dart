import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/model/profile_model.dart';

part 'documentation_events.dart';
part 'documentation_state.dart';

class DocsBloc extends Bloc<DocsEvents, DocsState> {
  DocsBloc() : super(const DocsState()) {
    on<DocsInitEvent>((event, emit) {
      emit(state.copyWith(status: BlocStatus.loading));
    });
    on<DocsInitSuccessEvent>((event, emit) => emit(state.copyWith(
          profile: event.profile,
          // hygiene: event.profile.hygienePhoto,
          // risk: event.profile.riskPhoto,
          // registeration: event.profile.regiserationPhoto,
          // passport: event.profile.passportPhoto,
          // nid: event.profile.nidPhoto,
          status: BlocStatus.initSuccess,
        )));
    on<DocsInitFailedEvent>(
        (event, emit) => emit(state.copyWith(status: BlocStatus.initError)));

    on<UploadCompleteEvent>((event, emit) {
      emit(state.copyWith(status: BlocStatus.success));
    });

// Hygiene
    on<UploadHygieneEvent>((event, emit) => emit(state.copyWith(
        profile: state.profile.copyWith(hygienePhoto: event.data),
        hygieneStatus: BlocStatus.loading)));
    on<UploadHygieneSuccessEvent>((event, emit) =>
        emit(state.copyWith(hygieneStatus: BlocStatus.success)));
    on<UploadHygieneErrorEvent>(
        (event, emit) => emit(state.copyWith(hygieneStatus: BlocStatus.error)));

// Registeration
    on<UploadRegisterationEvent>((event, emit) => emit(state.copyWith(
        profile: state.profile.copyWith(regiserationPhoto: event.data),
        registerationStatus: BlocStatus.loading)));
    on<UploadRegisterationSuccessEvent>((event, emit) =>
        emit(state.copyWith(registerationStatus: BlocStatus.success)));
    on<UploadRegisterationErrorEvent>((event, emit) =>
        emit(state.copyWith(registerationStatus: BlocStatus.error)));

// Risk
    on<UploadRiskEvent>((event, emit) => emit(state.copyWith(
        profile: state.profile.copyWith(riskPhoto: event.data),
        riskStatus: BlocStatus.loading)));
    on<UploadRiskSuccessEvent>(
        (event, emit) => emit(state.copyWith(riskStatus: BlocStatus.success)));
    on<UploadRiskErrorEvent>(
        (event, emit) => emit(state.copyWith(riskStatus: BlocStatus.error)));

// ID
    on<UploadIDEvent>((event, emit) => emit(state.copyWith(
        profile: state.profile.copyWith(nidPhoto: event.data),
        idStatus: BlocStatus.loading)));
    on<UploadIDSuccessEvent>(
        (event, emit) => emit(state.copyWith(idStatus: BlocStatus.success)));
    on<UploadIDErrorEvent>(
        (event, emit) => emit(state.copyWith(idStatus: BlocStatus.error)));
  }
}
