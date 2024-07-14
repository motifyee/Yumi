import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/auth/registeration/registeration_screen/registeration_screen.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/core/resources/app_assets.dart';
import 'package:yumi/global.dart';
import 'package:common_code/components/otp/otp.dart';

@RoutePage()
class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otp = '';
    final regCubit = G().rd<RegCubit>();

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
                      Image.asset(AppAssets.otpIcon),
                      const SizedBox(height: 60),
                      Text(
                        "OTP Verification",
                        style: TextStyle(
                          fontSize: CommonFontSize.font_24,
                          fontWeight: FontWeight.bold,
                          color: CommonColors.primary,
                        ),
                      ),
                      BlocSelector<RegCubit, RegState, String?>(
                        selector: (state) => state.phone,
                        builder: (context, phone) {
                          return RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Enter the OTP sent to ",
                                  style: TextStyle(
                                    fontSize: CommonFontSize.font_10,
                                    color: CommonColors.secondaryTant,
                                  ),
                                ),
                                TextSpan(
                                  text: phone,
                                  style: TextStyle(
                                    fontSize: CommonFontSize.font_12,
                                    fontWeight: FontWeight.bold,
                                    color: CommonColors.secondary,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      BlocSelector<RegCubit, RegState, String?>(
                        selector: (state) => state.otp,
                        builder: (_, state) {
                          if (!regCubit.state.status.isLoading &&
                              (state?.length ?? 0) < 4) {
                            regCubit.getMobileOTP();
                          }

                          if (state != null) otp = state;

                          // to force call initState() of OTP widget if the otp changed
                          final forceRebuildKey = GlobalKey();

                          return OTP(
                              key: forceRebuildKey,
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
                              fontSize: CommonFontSize.font_12,
                              fontWeight: FontWeight.normal,
                              color: CommonColors.secondaryTant,
                            ),
                          ),
                          BlocSelector<RegCubit, RegState, int?>(
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
                                    fontSize: CommonFontSize.font_12,
                                    fontWeight: FontWeight.normal,
                                    color: CommonColors.primary,
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
                                G().snackBar('Failed verify OTP. Try again!');
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
