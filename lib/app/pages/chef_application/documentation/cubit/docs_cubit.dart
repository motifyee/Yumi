import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/app/pages/driver/driver_reg_cubit.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/global.dart';

part 'docs_cubit.freezed.dart';

@freezed
class DocsState with _$DocsState {
  const factory DocsState({
    @Default(Profile()) Profile profile,
    @Default(Status.init) Status status,
    @Default('') String message,
    @Default([null, null, null, null, null]) List<Status?> docsStatuses,
  }) = _Init;

  const DocsState._();

  bool get isUploading => docsStatuses.any((e) => e?.isLoading ?? false);
  bool get finished => profile.documentaionDone;
}

class DocsCubit extends Cubit<DocsState> {
  DocsCubit() : super(const DocsState());

  void init() async {
    emit(state.copyWith(status: Status.loading));

    final load = await G.rd<ProfileCubit>().getProfileForm();

    if (load != null) {
      emit(state.copyWith(profile: load, status: Status.initSuccess));
    } else {
      emit(state.copyWith(status: Status.initError));
    }
  }

  void update(Profile profile, int idx) async {
    emit(state.copyWith(
      status: Status.loading,
      docsStatuses: [...state.docsStatuses]..[idx] = Status.loading,
    ));

    final update = await G.rd<ProfileCubit>().updateProfileForm(profile);

    if (update != null) {
      emit(state.copyWith(
        profile: update,
        status: Status.success,
        docsStatuses: [...state.docsStatuses]..[idx] = Status.success,
      ));
    } else {
      emit(state.copyWith(
        status: Status.error,
        docsStatuses: [...state.docsStatuses]..[idx] = Status.error,
      ));
    }

    G.rd<RegCubit>().refresh();
  }

  void reset() {
    emit(const DocsState());
  }
}
