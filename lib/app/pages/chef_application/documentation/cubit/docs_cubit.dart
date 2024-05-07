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
    var profileCubit = G.rd<ProfileCubit>();
    await profileCubit.getProfileForm();

    StreamSubscription<ProfileState>? sub;
    sub = profileCubit.stream.listen((event) {
      if (event.form.entityStatus.isLoading) {
        emit(state.copyWith(status: Status.loading));
      }

      if (event.form.entityStatus.isSuccess) {
        emit(state.copyWith(
          profile: profileCubit.state.form,
          status: Status.initSuccess,
        ));
        if (sub != null) sub.cancel();
      }

      if (event.form.entityStatus.isError) {
        emit(state.copyWith(status: Status.initError));
        if (sub != null) sub.cancel();
      }
    });
  }

  void update(Profile profile, int idx) async {
    var profileCubit = G.rd<ProfileCubit>();
    await profileCubit.updateProfileForm(profile);

    var regCubit = G.rd<RegCubit>();

    StreamSubscription<ProfileState>? sub;
    sub = profileCubit.stream.listen((event) {
      if (event.form.entityStatus.isLoading) {
        emit(state.copyWith(
          status: Status.loading,
          docsStatuses: [...state.docsStatuses]..[idx] = Status.loading,
        ));
      }

      if (event.form.entityStatus.isSuccess) {
        emit(state.copyWith(
          profile: profileCubit.state.form,
          status: Status.success,
          docsStatuses: [...state.docsStatuses]..[idx] = Status.success,
        ));
        if (sub != null) sub.cancel();
        regCubit.refresh();
      }

      if (event.form.entityStatus.isError) {
        emit(state.copyWith(
          status: Status.error,
          docsStatuses: [...state.docsStatuses]..[idx] = Status.error,
        ));
        if (sub != null) sub.cancel();
        regCubit.refresh();
      }
    });
  }
}
