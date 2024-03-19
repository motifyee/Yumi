import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/features/schedule/bloc/schedule_bloc.dart';
import 'package:yumi/features/schedule/repository/mock.dart';
import 'package:yumi/presentation/otp.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/confirm_button.dart';
import 'package:yumi/template/screen_container.dart';
import 'package:yumi/template/text_form_field.dart';
import 'package:yumi/validators/email_validator.dart';

@RoutePage()
class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          body: SingleChildScrollView(
            child: BlocBuilder<ScheduleBloc, ScheduleState>(
              builder: (context, state) {
                // if (state.status.isInit) {
                //   context.read<ScheduleBloc>().add(ScheduleEvent.init(context));
                // }
                // if (state.status.isLoading) {
                //   return const Center(child: CircularProgressIndicator());
                // }

                var phoneNumber = "+20-1015983432";

                return Center(
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
                                  text: phoneNumber,
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
                          OTP(
                            onLastFilled: (input) =>
                                print('$input | last filled'),
                          ),
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
                              label: "Verify & Proceed", onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
