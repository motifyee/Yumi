import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:common_code/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:yumi/core/resources/app_assets.dart';
import 'package:yumi/extensions/string.dart';
import 'package:yumi/global.dart';
import 'package:common_code/components/text_form_field.dart';
import 'package:yumi/core/util/util.dart';
import 'package:yumi/validators/email_validator.dart';

final GlobalKey<FormState> form = GlobalKey<FormState>();

class ForgotPwdEnterEmail extends StatelessWidget {
  ForgotPwdEnterEmail({super.key});
  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final email = context.read<ForgotPwdCubit>().state;
    return Column(
      children: [
        const SizedBox(height: 40),
        Text(
          'Forgot Your Password',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'We\'ll send you a verification code that will sign you into the app',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 30),
        // BlocBuilder<ForgotPwdCubit, ForgotPwdState>(
        // builder: (context, state) {
        BlocSelector<ForgotPwdCubit, ForgotPwdState, ForgotPwdVerificationType>(
          selector: (state) => state.verificationType,
          builder: (context, verificationType) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () => context
                          .read<ForgotPwdCubit>()
                          .setVerificationType(ForgotPwdVerificationType.email),
                      child: SvgPicture.asset(
                        verificationType == ForgotPwdVerificationType.email
                            ? AppAssets.emailMsgIcon
                            : AppAssets.emailMsgInactiveIcon,
                      ),
                    ),
                    InkWell(
                      onTap: () => context
                          .read<ForgotPwdCubit>()
                          .setVerificationType(
                              ForgotPwdVerificationType.mobile),
                      child: SvgPicture.asset(
                        verificationType == ForgotPwdVerificationType.mobile
                            ? AppAssets.mobileMsgIcon
                            : AppAssets.mobileMsgInactiveIcon,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Form(
                  key: form,
                  child: TextFormFieldTemplate(
                    initialValue: context.read<ForgotPwdCubit>().state.email,
                    label: verificationType == ForgotPwdVerificationType.email
                        ? 'Email'
                        : 'Mobile Number',
                    validators:
                        verificationType == ForgotPwdVerificationType.email
                            ? emailValidator
                            : mobileValidator,
                    autoHint: const [AutofillHints.password],
                    controller: inputController,
                    // prefixText: isNumeric(state.email) ? '+kUKCountryCode ' : null,
                    onChange: (value) =>
                        context.read<ForgotPwdCubit>().emailChanged(value),
                  ),
                ),
              ],
            );
          },
        ),
        // },
        // ),
        const SizedBox(height: 60),
        InteractiveButton(
            label: 'Send',
            onPressed: () async {
              final txt = context.read<ForgotPwdCubit>().state.email.trim();
              if (!form.currentState!.validate()) return;

              final cubit = context.read<ForgotPwdCubit>();
              if (isNumeric(txt)) {
                await cubit.resetPasswordByMobile();
              } else {
                await cubit.resetPasswordByEmail(txt);
              }

              if (cubit.state.emailFound) {
                G().snackBar('Check your email for verification code');
              } else {
                G().snackBar(
                    cubit.state.error.onEmpty("Something went wrong!"));
              }
            }),
        const SizedBox(height: 60),
      ],
    );
  }
}
