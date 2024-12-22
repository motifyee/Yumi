import 'package:dependencies/dependencies.dart';

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
  AppInfoCubit() : super(const AppInfoState());

  getAppInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    emit(state.copyWith(packageInfo: packageInfo));
  }
}
