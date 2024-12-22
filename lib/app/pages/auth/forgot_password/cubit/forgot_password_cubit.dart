import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/core/util/constants.dart';
import 'package:yumi/global.dart';

part 'forgot_password_state.dart';
part 'forgot_password_cubit.freezed.dart';

const forgotPwdEmailKey = 'forgot_pwd_email';
const forgotPwdTimeKey = 'forgot_pwd_time';

class ForgotPwdCubit extends Cubit<ForgotPwdState> {
  ForgotPwdCubit() : super(const ForgotPwdState());

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void init() async {
    final prefs = await G().prefs;

    final email = prefs.getString(forgotPwdEmailKey);
    if (email == null) return;

    final time = prefs.getInt(forgotPwdTimeKey) ?? 0;

    if ((DateTime.now().millisecondsSinceEpoch - time) >= 1000 * 60) {
      prefs.remove(forgotPwdTimeKey);
      prefs.remove(forgotPwdEmailKey);
      return;
    }

    emit(
      state.copyWith(
        email: email,
        initialCountDownTime: time,
        window: ForgotPwdWindow.enterOTP,
      ),
    );

    startCountDown();
  }

  void setVerificationType(ForgotPwdVerificationType type) {
    emit(state.copyWith(verificationType: type));
  }

  Unique? _unique;
  void startCountDown([int countDown = 60]) {
    final lUnique = unique();

    if (state.countDown == null) {
      _unique = lUnique;

      final d = DateTime.now().millisecondsSinceEpoch -
          (state.initialCountDownTime ?? 0);
      if (d >= 1000 * 60) return emit(state.copyWith(countDown: null));

      emit(
        state.copyWith(
          countDown: countDown - (d / 1000).round(),
        ),
      );
    }

    void recur() => Future.delayed(const Duration(seconds: 1), () {
          if (isClosed) return;

          if (state.countDown == null) return; // has been stopped || timed out
          if (lUnique != _unique) return; // has been restarted

          if ((state.countDown ?? 0) <= 0) {
            return emit(state.copyWith(countDown: null));
          }

          emit(state.copyWith(countDown: state.countDown! - 1));

          recur();
        });

    recur();
  }

  void stopCountDown() async {
    _unique = unique();
    emit(state.copyWith(countDown: null));

    final prefs = await G().prefs;
    prefs.remove(forgotPwdTimeKey);
    prefs.remove(forgotPwdEmailKey);
  }

  Future<void> resetPasswordByEmail([String? email]) async {
    final email0 = email ?? state.email;

    emit(state.copyWith(isLoading: true, email: email0));

    final forgot =
        await ResetPasswordByEmail().call(ResetPasswordByEmailParams(email0));

    forgot.fold(
      (l) => emit(
        state.copyWith(
          error: 'Can\'t reset password, check your email!',
          isLoading: false,
          emailFound: false,
        ),
      ),
      (r) {
        final initialCountDown = DateTime.now().millisecondsSinceEpoch;

        G().prefs.then((prefs) async {
          await prefs.setString(forgotPwdEmailKey, email0);
          await prefs.setInt(forgotPwdTimeKey, initialCountDown);
        });

        emit(
          state.copyWith(
            isLoading: false,
            email: email0,
            initialCountDownTime: initialCountDown,
            countDown: null,
            emailFound: true,
            window: ForgotPwdWindow.enterOTP,
          ),
        );

        startCountDown();
      },
    );
  }
  // if (state.isEmailValid) { }

  Future<void> verifyResetPasswordByEmailOTPCode(
    String otp,
    String password,
  ) async {
    emit(state.copyWith(isLoading: true));

    final verify = await VerifyResetPasswordByEmailOTP()
        .call(VerifyResetPasswordOTPByEmailParams(state.email, otp, password));
    Failure;
    verify.fold(
      (l) => emit(
        state.copyWith(
          codeSent: true,
          codeVerified: false,
          isLoading: false,
          otpCode: otp,
          newPassword: password,
          error: switch (l) {
            ServerFailure() => (l.error as dynamic).error as String,
            NetworkFailure() => 'Can\'t connect to server',
            _ => 'Something went wrong',
          },
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            codeSent: true,
            codeVerified: true,
            isLoading: false,
            window: ForgotPwdWindow.done,
          ),
        );

        stopCountDown();
      },
    );
  }

  Future<void> resetPasswordByMobile([String? mobile]) async {
    final mobile0 = mobile ?? state.email;

    emit(state.copyWith(isLoading: true, email: mobile0));

    final forgot = await ResetPasswordByMobile()
        .call(ResetPasswordByMobileParams('$kUKCountryCode$mobile0'));

    forgot.fold(
      (l) => emit(
        state.copyWith(
          error: 'Can\'t reset password, check your mobile number!',
          isLoading: false,
          emailFound: false,
        ),
      ),
      (r) {
        final initialCountDown = DateTime.now().millisecondsSinceEpoch;

        G().prefs.then((prefs) async {
          await prefs.setString(forgotPwdEmailKey, mobile0);
          await prefs.setInt(forgotPwdTimeKey, initialCountDown);
        });

        emit(
          state.copyWith(
            isLoading: false,
            email: mobile0,
            initialCountDownTime: initialCountDown,
            countDown: null,
            emailFound: true,
            window: ForgotPwdWindow.enterOTP,
          ),
        );

        startCountDown();
      },
    );

    // if (state.isEmailValid) { }
  }

  Future<void> verifyResetPasswordByMobileOTPCode(
    String otp,
    String password,
  ) async {
    emit(state.copyWith(isLoading: true));

    final verify = await VerifyResetPasswordByMobileOTP().call(
      VerifyResetPasswordOTPByMobileParams(
        '$kUKCountryCode${state.email}',
        otp,
        password,
      ),
    );
    Failure;
    verify.fold(
      (l) => emit(
        state.copyWith(
          codeSent: true,
          codeVerified: false,
          isLoading: false,
          otpCode: otp,
          newPassword: password,
          error: switch (l) {
            ServerFailure() => l.error.toString(),
            // (l.error as dynamic).response.data['message'] as String,
            NetworkFailure() => 'Can\'t connect to server',
            _ => 'Something went wrong',
          },
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            codeSent: true,
            codeVerified: true,
            isLoading: false,
            window: ForgotPwdWindow.done,
          ),
        );

        stopCountDown();
      },
    );
  }

  Future<void> resetPassword(String password) async {
    emit(
      state.copyWith(
        newPassword: password,
        passwordUpdated: true,
      ),
    );

    if (state.isPasswordUpdated) {
      G().pop();
    }
  }

  void setWindow(ForgotPwdWindow window) {
    emit(state.copyWith(window: window));
  }

  @override
  Future<void> close() {
    _unique = unique();

    return super.close();
  }
}
