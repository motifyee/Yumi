import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/text_form_field.dart';
import 'package:yumi/validators/confirm_password_validator.dart';
import 'package:yumi/validators/password_validator.dart';

class ForgotPwdNewPwd extends StatelessWidget {
  ForgotPwdNewPwd({super.key});

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Text(
          'Reset Password',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Password should contain at least 6 characters.',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 60),
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
                // onSave: (value) => {loginForm.email = value ?? ''},
              ),
              SizedBox(
                height: ThemeSelector.statics.formFieldGap,
              ),
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
        const SizedBox(height: 60),
        InteractiveButton(
            label: 'Confirm',
            onPressed: () {
              if (!form.currentState!.validate()) return;

              context
                  .read<ForgotPwdCubit>()
                  .resetPassword(passwordController.text);
            }),
        const SizedBox(height: 60),
      ],
    );
  }
}
