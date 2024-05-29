import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/interactive_button/interactive_button.dart';
import 'package:yumi/app/pages/auth/registeration/reg_screen.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/global.dart';
import 'package:yumi/presentation/otp.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/screen_container.dart';

@RoutePage()
class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otp = '';
    final regCubit = G.rd<RegCubit>();

    return PopScope(
      canPop: regCubit.state.partialFlow ? true : false,
      onPopInvoked: (didPop) {
        if (!regCubit.state.partialFlow) askToLogout(context);
      },
      child: ScreenContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/registeration/otp.png",
                      ),
                      const SizedBox(height: 60),
                      Text(
                        "OTP Verification",
                        style: TextStyle(
                          fontSize: ThemeSelector.fonts.font_24,
                          fontWeight: FontWeight.bold,
                          color: ThemeSelector.colors.primary,
                        ),
                      ),
                      BlocSelector<RegCubit, NRegState, String?>(
                        selector: (state) => state.phone,
                        builder: (context, phone) {
                          return RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Enter the OTP sent to ",
                                  style: TextStyle(
                                    fontSize: ThemeSelector.fonts.font_10,
                                    color: ThemeSelector.colors.secondaryTant,
                                  ),
                                ),
                                TextSpan(
                                  text: phone,
                                  style: TextStyle(
                                    fontSize: ThemeSelector.fonts.font_12,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeSelector.colors.secondary,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      BlocSelector<RegCubit, NRegState, String?>(
                        selector: (state) => state.otp,
                        builder: (_, state) {
                          if (!regCubit.state.status.isLoading &&
                              (state?.length ?? 0) < 4) {
                            regCubit.getMobileOTP();
                          }

                          if (state != null) otp = state;

                          return OTP(
                              initialOTP: state,
                              onInput: (value, _, __) => otp = value);
                        },
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't receive an OTP?  ",
                            style: TextStyle(
                              fontSize: ThemeSelector.fonts.font_12,
                              fontWeight: FontWeight.normal,
                              color: ThemeSelector.colors.secondaryTant,
                            ),
                          ),
                          BlocSelector<RegCubit, NRegState, int?>(
                            selector: (state) => state.countDown,
                            builder: (context, countDown) {
                              return TextButton(
                                onPressed: () {
                                  if ((countDown ?? 0) > 0) return;

                                  regCubit.getMobileOTP();
                                },
                                child: Text(
                                  (countDown ?? 0) > 0
                                      ? countDown.toString()
                                      : "Resend OTP",
                                  style: TextStyle(
                                    fontSize: ThemeSelector.fonts.font_12,
                                    fontWeight: FontWeight.normal,
                                    color: ThemeSelector.colors.primary,
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                      InteractiveButton(
                          label: "Verify & Proceed",
                          onPressed: () async {
                            if (kReleaseMode && otp.length < 4) return;

                            await context
                                .read<RegCubit>()
                                .verifyMobileOTP(otp)
                                .then((value) {
                              if (regCubit.state.status.isError) {
                                G.snackBar('Failed verify OTP. Try again!');
                              }
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
