import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common_code/domain/auth/entities/login_data.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:common_code/domain/address/entity/address.dart';
import 'package:common_code/domain/auth/use_cases/login_with_email.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/app/yumi/config/chef/chef_routes.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';

part 'login_cubit.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginData(email: '', password: '')) LoginData loginData,
    @Default(false) bool isLoading,
  }) = _Initial;
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  setLoginData(LoginData Function(LoginData loginData) fn) =>
      emit(state.copyWith(loginData: fn(state.loginData)));

  /// login with email and returns error message or null if success
  Future<String?> login() async {
    emit(state.copyWith(isLoading: true));
    final loginData = state.loginData;

    final params = LoginWithEmailParams(loginData);
    return await LoginWithEmail().call(params).then(
          (v) => v.fold(
            (l) => l.toString(),
            (user) async {
              emit(state.copyWith(isLoading: false));

              await G()
                  .rd<UserCubit>()
                  .saveUser(user.copyWith(password: loginData.password));

              int getPendingRegStep() {
                var regStep = -1;

                if (!(user.mobileVerified ?? false)) {
                  regStep = RegStep.addPhone.index;
                } else if (user.address?.isEmpty ?? true) {
                  regStep = RegStep.location.index;
                } else if (!G().isCustomerApp &&
                    (!(user.accountApproved ?? false) ||
                        !(user.contractApproved ?? false))) {
                  regStep = RegStep.onboarding.index;
                }

                return regStep;
              }

              final regStep = getPendingRegStep();
              if (regStep == -1) {
                await G().router.replaceAll([HomeRoute()]);

                return null;
              }

              await G().rd<RegCubit>().saveStepToCache(regStep).then(
                (value) {
                  G().router.push(const RegisterationRoute());
                  G().rd<RegCubit>().initReg();
                },
              );

              G().rd<UserCubit>().saveLocation(Address.fromJson(user.toJson()));

              return null;
            },
          ),
        );
  }
}
