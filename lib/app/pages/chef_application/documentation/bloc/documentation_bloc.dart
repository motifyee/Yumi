import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/domain/profile/entities/profile.dart';

part 'documentation_events.dart';
part 'documentation_state.dart';

class DocsBloc extends Bloc<DocsEvents, DocsState> {
  DocsBloc() : super(const DocsState()) {
    on<DocsInitEvent>((event, emit) {
      emit(state.copyWith(status: ObseleteStatusEnum.loading));
    });
    on<DocsInitSuccessEvent>((event, emit) => emit(state.copyWith(
          profile: event.profile,
          // hygiene: event.profile.hygienePhoto,
          // risk: event.profile.riskPhoto,
          // registeration: event.profile.regiserationPhoto,
          // passport: event.profile.passportPhoto,
          // nid: event.profile.nidPhoto,
          status: ObseleteStatusEnum.initSuccess,
        )));
    on<DocsInitFailedEvent>((event, emit) =>
        emit(state.copyWith(status: ObseleteStatusEnum.initError)));

    on<UploadCompleteEvent>((event, emit) {
      emit(state.copyWith(status: ObseleteStatusEnum.success));
    });

// Hygiene
    on<UploadHygieneEvent>((event, emit) => emit(state.copyWith(
        profile: state.profile.copyWith(hygienePhoto: event.data),
        hygieneStatus: ObseleteStatusEnum.loading)));
    on<UploadHygieneSuccessEvent>((event, emit) =>
        emit(state.copyWith(hygieneStatus: ObseleteStatusEnum.success)));
    on<UploadHygieneErrorEvent>((event, emit) =>
        emit(state.copyWith(hygieneStatus: ObseleteStatusEnum.error)));

// Registeration
    on<UploadRegisterationEvent>((event, emit) => emit(state.copyWith(
        profile: state.profile.copyWith(registerationPhoto: event.data),
        registerationStatus: ObseleteStatusEnum.loading)));
    on<UploadRegisterationSuccessEvent>((event, emit) =>
        emit(state.copyWith(registerationStatus: ObseleteStatusEnum.success)));
    on<UploadRegisterationErrorEvent>((event, emit) =>
        emit(state.copyWith(registerationStatus: ObseleteStatusEnum.error)));

// Risk
    on<UploadRiskEvent>((event, emit) => emit(state.copyWith(
        profile: state.profile.copyWith(riskPhoto: event.data),
        riskStatus: ObseleteStatusEnum.loading)));
    on<UploadRiskSuccessEvent>((event, emit) =>
        emit(state.copyWith(riskStatus: ObseleteStatusEnum.success)));
    on<UploadRiskErrorEvent>((event, emit) =>
        emit(state.copyWith(riskStatus: ObseleteStatusEnum.error)));

// ID
    on<UploadIDEvent>((event, emit) => emit(state.copyWith(
        profile: state.profile.copyWith(nidPhoto: event.data),
        idStatus: ObseleteStatusEnum.loading)));
    on<UploadIDSuccessEvent>((event, emit) =>
        emit(state.copyWith(idStatus: ObseleteStatusEnum.success)));
    on<UploadIDErrorEvent>((event, emit) =>
        emit(state.copyWith(idStatus: ObseleteStatusEnum.error)));
  }
}
