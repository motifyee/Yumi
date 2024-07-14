import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:common_code/util/status.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/global.dart';

part 'docs_cubit.freezed.dart';

@freezed
class DocsState with _$DocsState {
  const factory DocsState({
    @Default(Status.init) Status status,
    @Default('') String message,
    @Default([null, null, null, null, null]) List<Status?> docsStatuses,
  }) = _Init;

  const DocsState._();

  bool get isUploading => docsStatuses.any((e) => e?.isLoading ?? false);
  bool get finished => G().rd<ProfileCubit>().state.form.documentaionDone;
}

class DocsCubit extends Cubit<DocsState> {
  DocsCubit() : super(const DocsState());

  void init() async {
    emit(state.copyWith(status: Status.loading));

    final profileCubit = G().rd<ProfileCubit>();
    final profile = switch (profileCubit.state.form.guid.isEmpty) {
      true => await profileCubit.getProfileForm(),
      false => profileCubit.state.form,
    };

    if (profile == null || profile.guid.isEmpty) {
      return emit(state.copyWith(status: Status.initError));
    }

    emit(state.copyWith(status: Status.initSuccess));
  }

  void update(Profile profile, int idx) async {
    emit(state.copyWith(
      status: Status.loading,
      docsStatuses: [...state.docsStatuses]..[idx] = Status.loading,
    ));

    final update = await G().rd<ProfileCubit>().updateProfileForm(profile);

    if (update != null) {
      emit(state.copyWith(
        status: Status.success,
        docsStatuses: [...state.docsStatuses]..[idx] = Status.success,
      ));
    } else {
      emit(state.copyWith(
        status: Status.error,
        docsStatuses: [...state.docsStatuses]..[idx] = Status.error,
      ));
    }

    G().rd<RegCubit>().refresh();
  }

  void reset() {
    emit(const DocsState());
  }
}
