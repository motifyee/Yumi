import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/app/pages/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:common_code/components/otp/otp.dart';
import 'package:yumi/validators/confirm_password_validator.dart';
import 'package:yumi/validators/password_validator.dart';

class ForgotPwdEnterOTP extends StatelessWidget {
  const ForgotPwdEnterOTP({super.key});

  @override
  Widget build(BuildContext context) {
    var otp = '';
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> form = GlobalKey<FormState>();
    final cubit = context.read<ForgotPwdCubit>();

    return Column(
      children: [
        Text(
          'Enter 4 digits code',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Enter code sent to your email.',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        BlocSelector<ForgotPwdCubit, ForgotPwdState, int?>(
          selector: (state) => state.countDown,
          builder: (context, countDown) => SizedBox(
            width: (countDown ?? 0) > 0 ? 50 : 175,
            child: InteractiveButton(
              label: (countDown ?? 0) > 0 ? countDown.toString() : "Resend OTP",
              buttonType: ButtonType.text,
              foregroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () async {
                if ((countDown ?? 0) > 0) return;
                final entry = cubit.state.email;
                if (isNumeric(entry)) {
                  await cubit.resetPasswordByMobile();
                } else {
                  await cubit.resetPasswordByEmail();
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: 200,
            child: OTP(onInput: (value, _, __) => otp = value),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Reset Password',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Password should contain at least 6 characters.',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 30),
        Form(
          key: form,
          child: Column(
            children: [
              TextFormFieldTemplate(
                label: S.of(context).password,
                validators: passwordValidator,
                controller: passwordController,
                autoHint: const [AutofillHints.newPassword],
                isPassword: true,
                // initialValue: cubit.state.newPassword,
                // onSave: (value) => {loginForm.email = value ?? ''},
              ),
              const SizedBox(height: 30),
              TextFormFieldTemplate(
                label: 'Confirm Password',
                validators: (value) {
                  return confirmPasswordValidator(
                      value: value, comparedValue: passwordController.text);
                },
                isPassword: true,
                // autoHint: const [AutofillHints],
                // onSave: (value) => {LoginForm.password = value ?? ''},
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        InteractiveButton(
            label: 'Send',
            onPressed: () async {
              if (otp.length < 4) return G().snackBar("Invalid OTP!");
              if (!form.currentState!.validate()) return;

              final entry = cubit.state.email;

              if (isNumeric(entry)) {
                await cubit.verifyResetPasswordByMobileOTPCode(
                  otp,
                  passwordController.text,
                );
              } else {
                await cubit.verifyResetPasswordByEmailOTPCode(
                  otp,
                  passwordController.text,
                );
              }

              if (cubit.state.codeVerified) {
                return G().snackBar("Password reset successfully!");
              }

              G().snackBar(cubit.state.error);
            }),
        const SizedBox(height: 60),
      ],
    );
  }
}
