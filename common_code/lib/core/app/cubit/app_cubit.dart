import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';

part 'app_cubit.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    Unique? unique,
    required AppConfig config,
  }) = _AppState;
}

class AppCubit extends Cubit<AppState> {
  AppCubit(AppConfig config) : super(AppState(config: config));

  void refresh() => emit(state.copyWith(unique: unique()));

  Future<void> setLocale(String localeName) async {
    await CommonLocale.setAppLocale(localeName);
    refresh();
  }

  Future<void> toggleLocale() async {
    await CommonLocale.toggleAppLocale();
    refresh();
  }

  void setConfig(AppConfig config) => emit(state.copyWith(
        config: config,
        unique: unique(),
      ));
}
