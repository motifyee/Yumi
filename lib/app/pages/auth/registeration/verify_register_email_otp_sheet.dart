import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/driver/count_down_cubit.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/global.dart';
import 'package:yumi/presentation/otp.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/screen_container.dart';

class VerifyRegisterEmailOtpSheetProvider extends StatelessWidget {
  const VerifyRegisterEmailOtpSheetProvider({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountDownCubit>(
      create: (context) => CountDownCubit(),
      child: const VerifyRegisterEmailOtpSheet(),
    );
  }
}

class VerifyRegisterEmailOtpSheet extends StatelessWidget {
  const VerifyRegisterEmailOtpSheet({super.key});

  @override
  Widget build(BuildContext context) {
    String otp = '';
    final reg = context.read<RegCubit>();
    final counter = context.read<CountDownCubit>();
    if (counter.state.countDown == null) counter.startCountDown();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(
          top: ThemeSelector.statics.iconSizeSmall,
        ),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
                ThemeSelector.statics.defaultBorderRadiusExtraLarge),
            topLeft: Radius.circular(
                ThemeSelector.statics.defaultBorderRadiusExtraLarge),
          ),
          gradient: screenGradient,
        ),
        width: MediaQuery.of(context).size.width,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .7),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.only(
              left: ThemeSelector.statics.defaultBlockGap,
              right: ThemeSelector.statics.defaultBlockGap,
              top: ThemeSelector.statics.defaultGapExtreme,
            ),
            child: SingleChildScrollView(
              child: BlocBuilder<RegCubit, NRegState>(
                builder: (context, state) {
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
                      BlocBuilder<CountDownCubit, CountDownState>(
                        builder: (context, state) => SizedBox(
                          width: (state.countDown ?? 0) > 0 ? 50 : 175,
                          child: InteractiveButton(
                            label: (state.countDown ?? 0) > 0
                                ? state.countDown.toString()
                                : "Resend OTP",
                            buttonType: ButtonType.text,
                            foregroundColor:
                                Theme.of(context).colorScheme.primary,
                            onPressed: () async {
                              if ((state.countDown ?? 0) > 0) return;

                              await reg
                                  .getEmailOTP(reg.state.email!)
                                  .then((value) {
                                counter.startCountDown();
                              });
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
                      InteractiveButton(
                          label: 'Send',
                          onPressed: () async {
                            if (otp.length < 4) {
                              return G.snackBar("Invalid OTP!");
                            }

                            if (!reg.verifyEmailOTP(otp)) {
                              return G.snackBar("Wrong OTP!");
                            }

                            G.snackBar("Your email was verified successfully");
                            counter.stopCountDown(); // not to emit after close
                            Navigator.of(context).pop();
                          }),
                      const SizedBox(height: 60),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
