import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/app/pages/driver/driver_reg_cubit.dart';
import 'package:yumi/app/pages/settings/profile/bloc/profile_bloc.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/global.dart';

part 'docs_cubit.freezed.dart';

@freezed
class DocsState with _$DocsState {
  const factory DocsState({
    @Default(Profile()) Profile profile,
    @Default(ObseleteStatusEnum.init) ObseleteStatusEnum status,
    @Default('') String message,
    @Default([null, null, null, null, null])
    List<ObseleteStatusEnum?> docsStatuses,
  }) = _Init;

  const DocsState._();

  bool get isUploading => docsStatuses.any((e) => e?.isLoading ?? false);
  bool get finished => profile.documentaionDone;
}

class DocsCubit extends Cubit<DocsState> {
  DocsCubit() : super(const DocsState());

  void init() {
    var profileBloc = G.read<ProfileBloc>();
    profileBloc.add(const ProfileInitEvent());

    StreamSubscription<ProfileState>? sub;
    sub = profileBloc.stream.listen((event) {
      if (event.status.isLoading) {
        emit(state.copyWith(status: ObseleteStatusEnum.loading));
      }

      if (event.status.isInitSucces) {
        emit(state.copyWith(
          profile: profileBloc.state.profile,
          status: ObseleteStatusEnum.initSuccess,
        ));
        if (sub != null) sub.cancel();
      }

      if (event.status.isInitError) {
        emit(state.copyWith(status: ObseleteStatusEnum.initError));
        if (sub != null) sub.cancel();
      }
    });
  }

  void update(Profile profile, int idx) {
    var profileBloc = G.read<ProfileBloc>();
    profileBloc.add(ProfileUpdateEvent(profile: profile));

    var regCubit = G.rd<RegCubit>();

    StreamSubscription<ProfileState>? sub;
    sub = profileBloc.stream.listen((event) {
      if (event.status.isLoading) {
        emit(state.copyWith(
          status: ObseleteStatusEnum.loading,
          docsStatuses: [...state.docsStatuses]..[idx] =
              ObseleteStatusEnum.loading,
        ));
      }

      if (event.status.isSuccess) {
        emit(state.copyWith(
          profile: profileBloc.state.profile,
          status: ObseleteStatusEnum.success,
          docsStatuses: [...state.docsStatuses]..[idx] =
              ObseleteStatusEnum.success,
        ));
        if (sub != null) sub.cancel();
        regCubit.refresh();
      }

      if (event.status.isError) {
        emit(state.copyWith(
          status: ObseleteStatusEnum.error,
          docsStatuses: [...state.docsStatuses]..[idx] =
              ObseleteStatusEnum.error,
        ));
        if (sub != null) sub.cancel();
        regCubit.refresh();
      }
    });
  }
}
