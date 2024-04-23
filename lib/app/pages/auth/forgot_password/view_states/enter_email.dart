import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:yumi/global.dart';
import 'package:yumi/template/confirm_button.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/email_validator.dart';

class ForgotPwdEnterEmail extends StatelessWidget {
  ForgotPwdEnterEmail({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Text(
          'Enter your email address',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'We\'ll send verification code that will sign you into the app',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 60),
        BlocBuilder<ForgotPwdCubit, ForgotPasswordState>(
          builder: (context, state) {
            return TextFormFieldTemplate(
              initialValue: state.email,
              label: 'Email',
              validators: emailValidator,
              autoHint: const [AutofillHints.password],
              controller: emailController,
            );
          },
        ),
        const SizedBox(height: 60),
        ConfirmButton(
            label: 'Send',
            onPressed: () async {
              final txt = emailController.text;
              if (txt.isEmpty) return;
              if (emailValidator(txt) != null) return;

              final cubit = context.read<ForgotPwdCubit>();
              await cubit.forgotPassword(emailController.text);
            }),
        const SizedBox(height: 60),
      ],
    );
  }
}
