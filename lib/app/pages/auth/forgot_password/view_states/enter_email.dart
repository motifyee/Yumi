import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:yumi/global.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/util/util.dart';
import 'package:yumi/validators/email_validator.dart';

final GlobalKey<FormState> form = GlobalKey<FormState>();

class ForgotPwdEnterEmail extends StatelessWidget {
  ForgotPwdEnterEmail({super.key});
  final TextEditingController inputController = TextEditingController();

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
        Form(
          key: form,
          child: TextFormFieldTemplate(
            initialValue: context.read<ForgotPwdCubit>().state.email,
            label: 'Email / Mobile Number',
            validators: emailOrMobileValidator,
            autoHint: const [AutofillHints.password],
            controller: inputController,
            onChange: (value) =>
                context.read<ForgotPwdCubit>().emailChanged(value),
          ),
        ),
        const SizedBox(height: 60),
        InteractiveButton(
            label: 'Send',
            onPressed: () async {
              final txt = inputController.text;
              if (!form.currentState!.validate()) return;

              final cubit = context.read<ForgotPwdCubit>();
              if (isNumeric(txt)) {
                await cubit.resetPasswordByMobile(txt.trim());
              } else {
                await cubit.resetPasswordByEmail(txt.trim());
              }

              if (cubit.state.emailFound) {
                G.snackBar('Check your email for verification code');
              } else {
                G.snackBar(cubit.state.error);
              }
            }),
        const SizedBox(height: 60),
      ],
    );
  }
}
