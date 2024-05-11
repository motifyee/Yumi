import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'app_info_cubit.freezed.dart';
part 'app_info_cubit.g.dart';

@freezed
class AppInfoState with _$AppInfoState {
  const factory AppInfoState({
    @JsonKey(includeToJson: false, includeFromJson: false)
    PackageInfo? packageInfo,
  }) = _AppInfoState;

  factory AppInfoState.fromJson(Map<String, dynamic> json) =>
      _$AppInfoStateFromJson(json);
}

class AppInfoCubit extends Cubit<AppInfoState> {
  AppInfoCubit() : super(AppInfoState());

  getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    emit(state.copyWith(packageInfo: packageInfo));
  }
}
