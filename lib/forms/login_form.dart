import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/auth/forgot_password/forgot_password_sheet.dart';
import 'package:yumi/app/pages/auth/registeration/model/address.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/bloc/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/model/login_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/service/login_service.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/email_validator.dart';
import 'package:yumi/validators/password_validator.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key, required this.loginFormKey});

  final LoginModel loginForm = LoginModel(email: '', password: '');
  final GlobalKey<FormState> loginFormKey;

  @override
  Widget build(BuildContext context) {
    // redirect to registeration if has cached reg-steps
    final regCubit = G.rd<RegCubit>();
    final userCubit = G.rd<UserCubit>();

    G.rd<UserCubit>().loadUser().then((user) async {
      if (user == null) return;

      if (await regCubit.hasActiveRegisteration() &&
          userCubit.state.user.accessToken.isNotEmpty) {
        regCubit.init();
      }
    });
    // userBloc.add(
    //   LoadxUserFromSharedRefEvent(
    //     context: context,
    //     route: null,
    //     afterFetchSuccess: (context, _, user) async {},
    //     autoLogin: (_) {},
    //   ),
    // );

    return Form(
      key: loginFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ThemeSelector.statics.formFieldInlineGap),
        child: Column(
          children: [
            Column(
              children: [
                TextFormFieldTemplate(
                  label: S.of(context).email,
                  validators: emailValidator,
                  autoHint: const [AutofillHints.username],
                  onSave: (value) => {loginForm.email = value ?? ''},
                ),
                SizedBox(
                  height: ThemeSelector.statics.formFieldGap,
                ),
                TextFormFieldTemplate(
                  label: S.of(context).password,
                  validators: passwordValidator,
                  autoHint: const [AutofillHints.password],
                  onSave: (value) => {loginForm.password = value ?? ''},
                  isPassword: true,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    // context.router.push(const ForgetPasswordRoute());
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => const ForgotPasswordSheetProvider(
                        key: Key("ForgotPasswordSheet"),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(80, 20),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: Text(
                    "${S.of(context).forgetPassword}?",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                )
              ],
            ),
            SizedBox(
              height: ThemeSelector.statics.defaultGap,
            ),
            // ConfirmButton(
            InteractiveButton(
              label: S.of(context).login,
              // isFixedSize: false,
              height: 40,
              onPressed: () async {
                if (loginFormKey.currentState!.validate()) {
                  loginFormKey.currentState!.save();

                  await performLogin(context, loginForm);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

Future performLogin(BuildContext context, LoginModel loginForm,
    [String? route]) async {
  return await LoginServices.login(login: loginForm, context: context)
      .then((user) async {
    final Map<String, dynamic> json =
        user.copyWith(password: loginForm.password).toJson();

    if ((user.accessToken).isEmpty) {
      if (user.message.isEmpty) return G.snackBar("Login Failed!");
      return G.snackBar(user.message);
    }

    // save login data locally
    await G.rd<UserCubit>().saveUser(json).then((_) async {
      var regStep = -1;
      if (!(user.mobileVerified ?? false)) {
        regStep = RegStep.addPhone.index;
      } else if (user.address?.isEmpty ?? true) {
        regStep = RegStep.location.index;
      } else if (!G.isCustomerApp &&
          (!(user.accountApproved ?? false) ||
              !(user.contractApproved ?? false))) {
        regStep = RegStep.onboarding.index;
      }

      if (regStep == -1) return G.router.replaceAll([HomeRoute()]);

      await context.read<RegCubit>().saveStepToCache(regStep).then((value) {
        context.router.push(const RegisterationRoute());
        context.read<RegCubit>().init();
      });
    });
    // context.read<xUserBloc>().add(SavexUserFromJsonEvent(
    // user: json,
    //   routeAfterLogin: () async {
    //     var idx = -1;
    //     if (!(user.mobileVerified ?? false)) {
    //       idx = RegStep.addPhone.index;
    //     } else if (user.address?.isEmpty ?? true) {
    //       idx = RegStep.location.index;
    //     } else if (!G.isCustomerApp &&
    //         (!(user.accountApproved ?? false) ||
    //             !(user.contractApproved ?? false))) {
    //       idx = RegStep.onboarding.index;
    //     }

    //     if (idx == -1) return G.router.replaceAll([HomeRoute()]);

    //     await context.read<RegCubit>().saveStepToCache(idx).then((value) {
    //       context.router.push(const RegisterationRoute());
    //       context.read<RegCubit>().init();
    //     });
    //   },
    // ));

    print('login user .................................');
    print(json);

    context.read<UserCubit>().saveLocation(Address.fromJson(json));
    // .add(UserUpdateLocationEvent(address: Address.fromJson(json)));
  }).catchError((onError) => G.snackBar(S.of(context).connectionError));
}
