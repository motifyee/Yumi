import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/features/registeration/bloc/bloc.dart';
import 'package:yumi/features/schedule/bloc/schedule_bloc.dart';
import 'package:yumi/features/schedule/repository/mock.dart';
import 'package:yumi/presentation/otp.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/confirm_button.dart';
import 'package:yumi/template/screen_container.dart';

@RoutePage()
class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otp = '';

    return BlocProvider(
      create: (context) => ScheduleBloc(scheduleRepo: ScheduleMockRepo()),
      child: ScreenContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottomOpacity: 0,
            scrolledUnderElevation: 0,
            iconTheme: IconThemeData(color: ThemeSelector.colors.primary),
          ),
          body: BlocBuilder<RegBloc, RegState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),
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
                          RichText(
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
                                  text: state.phone,
                                  style: TextStyle(
                                    fontSize: ThemeSelector.fonts.font_12,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeSelector.colors.secondary,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          OTP(onInput: (value, _, __) => otp = value),
                          const SizedBox(height: 40),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Didn't receive an OTP?  ",
                                  style: TextStyle(
                                    fontSize: ThemeSelector.fonts.font_12,
                                    color: ThemeSelector.colors.secondaryTant,
                                  ),
                                ),
                                TextSpan(
                                  text: "Resned OTP",
                                  style: TextStyle(
                                    fontSize: ThemeSelector.fonts.font_12,
                                    color: ThemeSelector.colors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          ConfirmButton(
                              label: "Verify & Proceed",
                              onPressed: () {
                                if (otp.length < 4) return;

                                context
                                    .read<RegBloc>()
                                    .add(RegEvent.setOTP(otp, context));
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
