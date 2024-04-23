import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:yumi/presentation/otp.dart';
import 'package:yumi/template/confirm_button.dart';

class ForgotPwdEnterOTP extends StatelessWidget {
  const ForgotPwdEnterOTP({super.key});

  @override
  Widget build(BuildContext context) {
    var otp = '';

    return Column(
      children: [
        const SizedBox(height: 40),
        Text(
          'Enter 4 digits code',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Enter the 4 digits code that you received on your email.',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 60),
        Center(
          child: SizedBox(
            width: 200,
            child: OTP(onInput: (value, _, __) => otp = value),
          ),
        ),
        const SizedBox(height: 60),
        ConfirmButton(
            label: 'Send',
            onPressed: () {
              if (otp.length < 4) return;

              context.read<ForgotPwdCubit>().verifyOTPCode(otp);
            }),
        const SizedBox(height: 60),
      ],
    );
  }
}
