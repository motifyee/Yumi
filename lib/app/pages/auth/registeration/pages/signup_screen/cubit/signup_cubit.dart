import 'package:dependencies/dependencies.dart';
part 'signup_cubit.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    @Default(false) bool sheetIsActive,
    // PersistentBottomSheetController? sheetController,
  }) = _Initial;
}

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(const SignupState());

  void setSheetIsActive(bool value) {
    emit(state.copyWith(sheetIsActive: value));
  }
}
