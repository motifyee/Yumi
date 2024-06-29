import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/auth/forgot_password/forgot_password_sheet.dart';
import 'package:yumi/app/pages/auth/login/cubit/login_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/domain/auth/entities/login_data.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/text_form_field.dart';
import 'package:yumi/validators/email_validator.dart';
import 'package:yumi/validators/password_validator.dart';

class LoginFormProvider extends StatelessWidget {
  const LoginFormProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (_) => LoginCubit(),
      child: const LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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

    return Form(
      key: loginFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ThemeSelector.statics.formFieldInlineGap),
        child: Column(
          children: [
            // fields
            Column(
              children: [
                //
                // Email field
                TextFormFieldTemplate(
                  label: S.of(context).email,
                  validators: emailValidator,
                  autoHint: const [AutofillHints.username],
                  onSave: (value) => context
                      .read<LoginCubit>()
                      .setLoginData((m) => m.copyWith(email: value ?? '')),
                ),

                SizedBox(height: ThemeSelector.statics.formFieldGap),

                // Password field
                TextFormFieldTemplate(
                  label: S.of(context).password,
                  validators: passwordValidator,
                  autoHint: const [AutofillHints.password],
                  onSave: (value) => context
                      .read<LoginCubit>()
                      .setLoginData((m) => m.copyWith(password: value ?? '')),
                  isPassword: true,
                ),
              ],
            ),

            // forgot password
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

            SizedBox(height: ThemeSelector.statics.defaultGap),

            // login button
            InteractiveButton(
              label: S.of(context).login,
              height: 40,
              onPressed: () async {
                if (!loginFormKey.currentState!.validate()) return;

                loginFormKey.currentState!.save();
                // await performLogin(context, loginForm);
                final msg = await context.read<LoginCubit>().login();
                if (msg?.isNotEmpty ?? false) G.snackBar(msg!);
              },
            )
          ],
        ),
      ),
    );
  }
}

Future performLogin(BuildContext context, LoginData loginForm,
    [String? route]) async {
  // return await LoginServices.login(login: loginForm, context: context)
  //     .then((user) async {
  //   if ((user.accessToken).isEmpty) {
  //     if (user.message.isEmpty) return G.snackBar("Login Failed!");
  //     return G.snackBar(user.message);
  //   }
  //   // save login data locally
  //   await G
  //       .rd<UserCubit>()
  //       .saveUser(user.copyWith(password: loginForm.password))
  //       .then((_) async {});

  //   // context.read<UserCubit>().saveLocation(Address.fromJson(json));
  // }).catchError((onError) => G.snackBar(S.of(context).connectionError));
}
